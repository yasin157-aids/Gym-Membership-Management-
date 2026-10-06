from flask import Flask, render_template, request, redirect, url_for, session, flash
from werkzeug.security import generate_password_hash, check_password_hash
import mysql.connector

app = Flask(__name__)
app.secret_key = "gym-lab-demo-secret"

DB = {
    "host": "localhost",
    "user": "root",
    "password": "Yasin@2008",
    "database": "gym_management"
}


def db():
    return mysql.connector.connect(**DB)


def q(sql, args=(), fetch=True):
    c = db()
    cur = c.cursor(dictionary=True)
    cur.execute(sql, args)

    r = cur.fetchall() if fetch else None

    if not fetch:
        c.commit()

    cur.close()
    c.close()

    return r


def admin():
    return session.get("role") == "admin"


def customer():
    return session.get("role") == "customer"


# ---------------------------------------------------------
# HOME
# ---------------------------------------------------------

@app.route("/")
def home():
    return redirect(
        url_for("dashboard")
        if session.get("user_id")
        else url_for("login")
    )


# ---------------------------------------------------------
# LOGIN
# ---------------------------------------------------------

@app.route("/login", methods=["GET", "POST"])
def login():

    if request.method == "POST":

        u = request.form["username"].strip()
        p = request.form["password"]
        role = request.form["role"]

        rows = q(
            "SELECT * FROM users WHERE username=%s AND role=%s",
            (u, role)
        )

        if rows and check_password_hash(
            rows[0]["password_hash"],
            p
        ):

            x = rows[0]

            session.update(
                user_id=x["user_id"],
                username=x["username"],
                role=x["role"],
                member_id=x["member_id"]
            )

            return redirect(url_for("dashboard"))

        flash(
            "Invalid username, password, or selected role.",
            "error"
        )

    return render_template("login.html")


# ---------------------------------------------------------
# LOGOUT
# ---------------------------------------------------------

@app.route("/logout")
def logout():

    session.clear()

    return redirect(url_for("login"))


# ---------------------------------------------------------
# ADMIN DASHBOARD
# ---------------------------------------------------------

@app.route("/dashboard")
def dashboard():

    if customer():
        return redirect(url_for("my_dashboard"))

    if not admin():
        return redirect(url_for("login"))

    stats = q(
        """SELECT

        (SELECT COUNT(*) FROM members) members,

        (SELECT COUNT(*)
         FROM memberships
         WHERE status='Active') active,

        (SELECT COUNT(*)
         FROM memberships
         WHERE status='Expired') expired,

        (SELECT COUNT(*) FROM trainers) trainers,

        (SELECT COALESCE(SUM(amount),0)
         FROM payments) revenue,

        (SELECT COALESCE(SUM(amount),0)
         FROM payments
         WHERE YEAR(payment_date)=YEAR(CURDATE())
         AND MONTH(payment_date)=MONTH(CURDATE()))
         month_revenue,

        (SELECT COALESCE(SUM(amount),0)
         FROM payments
         WHERE YEAR(payment_date)=YEAR(CURDATE()))
         year_revenue,

        (SELECT COUNT(*) FROM payments)
        payment_count,

        (SELECT COUNT(*)
         FROM memberships
         WHERE status='Active'
         AND end_date BETWEEN CURDATE()
         AND DATE_ADD(CURDATE(),INTERVAL 30 DAY))
         expiring_count
        """
    )[0]

    recent = q(
        """SELECT member_id,
                  name,
                  join_date,
                  fitness_goal
           FROM members
           ORDER BY member_id DESC
           LIMIT 6"""
    )

    payments = q(
        """SELECT m.name,
                  p.amount,
                  p.payment_date,
                  p.payment_method
           FROM payments p
           JOIN members m
           ON p.member_id=m.member_id
           ORDER BY p.payment_date DESC,
                    p.payment_id DESC
           LIMIT 6"""
    )

    plans = q(
        """SELECT plan_name,
                  COUNT(*) total
           FROM memberships
           GROUP BY plan_name
           ORDER BY total DESC"""
    )

    expiring = q(
        """SELECT m.name,
                  ms.plan_name,
                  ms.end_date,
                  DATEDIFF(
                      ms.end_date,
                      CURDATE()
                  ) days_left

           FROM memberships ms

           JOIN members m
           ON ms.member_id=m.member_id

           WHERE ms.status='Active'

           AND ms.end_date BETWEEN
               CURDATE()
               AND DATE_ADD(
                   CURDATE(),
                   INTERVAL 30 DAY
               )

           ORDER BY ms.end_date
           LIMIT 6"""
    )

    goals = q(
        """SELECT fitness_goal,
                  COUNT(*) total
           FROM members
           GROUP BY fitness_goal
           ORDER BY total DESC"""
    )

    return render_template(
        "dashboard.html",
        stats=stats,
        recent=recent,
        payments=payments,
        plans=plans,
        expiring=expiring,
        goals=goals
    )


# ---------------------------------------------------------
# MEMBERS
# ---------------------------------------------------------

@app.route("/members")
def members():

    if not admin():
        return redirect(url_for("login"))

    s = request.args.get("search", "").strip()

    if s:

        rows = q(
            """SELECT m.*,
                      t.name trainer_name

               FROM members m

               LEFT JOIN trainers t
               ON m.trainer_id=t.trainer_id

               WHERE m.name LIKE %s
               OR m.phone LIKE %s
               OR m.email LIKE %s

               ORDER BY m.member_id DESC""",

            (
                f"%{s}%",
                f"%{s}%",
                f"%{s}%"
            )
        )

    else:

        rows = q(
            """SELECT m.*,
                      t.name trainer_name

               FROM members m

               LEFT JOIN trainers t
               ON m.trainer_id=t.trainer_id

               ORDER BY m.member_id DESC"""
        )

    return render_template(
        "members.html",
        members=rows,
        search=s
    )


# ---------------------------------------------------------
# ADD MEMBER
# ---------------------------------------------------------

@app.route("/members/add", methods=["GET", "POST"])
def add_member():

    if not admin():
        return redirect(url_for("login"))

    trainers = q(
        "SELECT * FROM trainers ORDER BY name"
    )

    if request.method == "POST":

        d = request.form

        q(
            """INSERT INTO members(
                name,
                date_of_birth,
                gender,
                phone,
                email,
                address,
                emergency_contact,
                join_date,
                height,
                weight,
                fitness_goal,
                blood_group,
                trainer_id
            )

            VALUES(
                %s,%s,%s,%s,%s,%s,%s,
                %s,%s,%s,%s,%s,%s
            )""",

            (
                d["name"],
                d["dob"] or None,
                d["gender"],
                d["phone"],
                d["email"],
                d["address"],
                d["emergency"],
                d["join_date"],
                d["height"] or None,
                d["weight"] or None,
                d["goal"],
                d["blood_group"],
                d["trainer_id"] or None
            ),

            False
        )

        flash(
            "Member added successfully.",
            "success"
        )

        return redirect(url_for("members"))

    return render_template(
        "member_form.html",
        trainers=trainers
    )


# ---------------------------------------------------------
# DELETE MEMBER
# ---------------------------------------------------------

@app.route("/members/delete/<int:mid>")
def delete_member(mid):

    if not admin():
        return redirect(url_for("login"))

    q(
        "DELETE FROM members WHERE member_id=%s",
        (mid,),
        False
    )

    flash(
        "Member deleted.",
        "success"
    )

    return redirect(url_for("members"))


# ---------------------------------------------------------
# TRAINERS
# ---------------------------------------------------------

@app.route("/trainers")
def trainers():

    if not admin():
        return redirect(url_for("login"))

    rows = q(
        """SELECT t.*,
                  COUNT(m.member_id) assigned

           FROM trainers t

           LEFT JOIN members m
           ON t.trainer_id=m.trainer_id

           GROUP BY t.trainer_id

           ORDER BY t.name"""
    )

    return render_template(
        "trainers.html",
        trainers=rows
    )


# ---------------------------------------------------------
# MEMBERSHIPS
# ---------------------------------------------------------

@app.route("/memberships")
def memberships():

    if not admin():
        return redirect(url_for("login"))

    rows = q(
        """SELECT ms.*,
                  m.name member_name

           FROM memberships ms

           JOIN members m
           ON ms.member_id=m.member_id

           ORDER BY ms.end_date"""
    )

    return render_template(
        "memberships.html",
        rows=rows
    )


# ---------------------------------------------------------
# ADD MEMBERSHIP
# ---------------------------------------------------------

@app.route("/memberships/add", methods=["GET", "POST"])
def add_membership():

    if not admin():
        return redirect(url_for("login"))

    members_list = q(
        "SELECT member_id,name FROM members ORDER BY name"
    )

    if request.method == "POST":

        d = request.form

        q(
            """INSERT INTO memberships(
                member_id,
                plan_name,
                start_date,
                end_date,
                fee,
                status
            )

            VALUES(%s,%s,%s,%s,%s,%s)""",

            (
                d["member_id"],
                d["plan"],
                d["start"],
                d["end"],
                d["fee"],
                d["status"]
            ),

            False
        )

        if d.get("record_payment") == "yes":

            q(
                """INSERT INTO payments(
                    member_id,
                    amount,
                    payment_date,
                    payment_method
                )

                VALUES(%s,%s,%s,%s)""",

                (
                    d["member_id"],
                    d["fee"],
                    d["start"],
                    d.get(
                        "payment_method",
                        "Cash"
                    )
                ),

                False
            )

        flash(
            "Membership added successfully.",
            "success"
        )

        return redirect(url_for("memberships"))

    return render_template(
        "membership_form.html",
        members=members_list
    )


# ---------------------------------------------------------
# PAYMENTS
# ---------------------------------------------------------

@app.route("/payments")
def payments():

    if not admin():
        return redirect(url_for("login"))

    rows = q(
        """SELECT p.*,
                  m.name member_name

           FROM payments p

           JOIN members m
           ON p.member_id=m.member_id

           ORDER BY p.payment_date DESC,
                    p.payment_id DESC"""
    )

    return render_template(
        "payments.html",
        rows=rows
    )


# ---------------------------------------------------------
# ADD PAYMENT
# ---------------------------------------------------------

@app.route("/payments/add", methods=["GET", "POST"])
def add_payment():

    if not admin():
        return redirect(url_for("login"))

    members_list = q(
        "SELECT member_id,name FROM members ORDER BY name"
    )

    if request.method == "POST":

        d = request.form

        q(
            """INSERT INTO payments(
                member_id,
                amount,
                payment_date,
                payment_method
            )

            VALUES(%s,%s,%s,%s)""",

            (
                d["member_id"],
                d["amount"],
                d["payment_date"],
                d["method"]
            ),

            False
        )

        flash(
            "Payment recorded.",
            "success"
        )

        return redirect(url_for("payments"))

    return render_template(
        "payment_form.html",
        members=members_list
    )


# ---------------------------------------------------------
# ATTENDANCE
# ---------------------------------------------------------

@app.route("/attendance")
def attendance():

    if not admin():
        return redirect(url_for("login"))

    rows = q(
        """SELECT a.attendance_id,
                  a.attendance_date,
                  a.status,
                  m.name member_name

           FROM attendance a

           JOIN members m
           ON a.member_id=m.member_id

           ORDER BY a.attendance_date DESC,
                    a.attendance_id DESC

           LIMIT 150"""
    )

    return render_template(
        "attendance.html",
        rows=rows
    )


# ---------------------------------------------------------
# ADD ATTENDANCE
# ---------------------------------------------------------

@app.route("/attendance/add", methods=["GET", "POST"])
def add_attendance():

    if not admin():
        return redirect(url_for("login"))

    members_list = q(
        "SELECT member_id,name FROM members ORDER BY name"
    )

    if request.method == "POST":

        d = request.form

        q(
            """INSERT INTO attendance(
                member_id,
                attendance_date,
                status
            )

            VALUES(%s,%s,%s)""",

            (
                d["member_id"],
                d["attendance_date"],
                d["status"]
            ),

            False
        )

        flash(
            "Attendance recorded.",
            "success"
        )

        return redirect(url_for("attendance"))

    return render_template(
        "attendance_form.html",
        members=members_list
    )


# ---------------------------------------------------------
# REPORTS
# ---------------------------------------------------------

@app.route("/reports")
def reports():

    if not admin():
        return redirect(url_for("login"))

    monthly = q(
        """SELECT
              DATE_FORMAT(
                  payment_date,
                  '%Y-%m'
              ) month,

              SUM(amount) revenue,

              COUNT(*) transactions

           FROM payments

           GROUP BY month

           ORDER BY month DESC"""
    )

    yearly = q(
        """SELECT
              YEAR(payment_date) year,

              SUM(amount) revenue,

              COUNT(*) transactions

           FROM payments

           GROUP BY YEAR(payment_date)

           ORDER BY year DESC"""
    )

    goals = q(
        """SELECT
              fitness_goal,
              COUNT(*) total

           FROM members

           GROUP BY fitness_goal

           ORDER BY total DESC"""
    )

    return render_template(
        "reports.html",
        monthly=monthly,
        yearly=yearly,
        goals=goals
    )


# ---------------------------------------------------------
# CUSTOMER DASHBOARD
# ---------------------------------------------------------

@app.route("/my-dashboard")
def my_dashboard():

    if not customer():
        return redirect(url_for("login"))

    mid = session["member_id"]

    rows = q(
        """SELECT
              m.*,
              t.name trainer_name,
              t.specialization

           FROM members m

           LEFT JOIN trainers t
           ON m.trainer_id=t.trainer_id

           WHERE m.member_id=%s""",

        (mid,)
    )

    if not rows:

        session.clear()

        return redirect(url_for("login"))

    m = rows[0]

    # Membership details
    ms = q(
        """SELECT *
           FROM memberships
           WHERE member_id=%s
           ORDER BY end_date DESC
           LIMIT 1""",

        (mid,)
    )

    # Payment history
    ps = q(
        """SELECT *
           FROM payments
           WHERE member_id=%s
           ORDER BY payment_date DESC""",

        (mid,)
    )

    # Attendance summary
    att = q(
        """SELECT
              COUNT(*) total_days,

              SUM(
                  CASE
                      WHEN status='Present'
                      THEN 1
                      ELSE 0
                  END
              ) present_days,

              SUM(
                  CASE
                      WHEN status='Absent'
                      THEN 1
                      ELSE 0
                  END
              ) absent_days

           FROM attendance

           WHERE member_id=%s""",

        (mid,)
    )[0]

    total = att["total_days"] or 0

    present = att["present_days"] or 0

    # Attendance percentage
    rate = (
        round(present / total * 100, 1)
        if total
        else 0
    )

    # Convert to float to avoid
    # Decimal × float TypeError
    rate = float(rate)

    # Estimate number of weeks
    weeks = max(
        1,
        round(total / 7)
    )

    # -----------------------------------------------------
    # FITNESS PROGRESS ESTIMATION
    # -----------------------------------------------------

    if m["fitness_goal"] == "Weight Loss":

        estimate = round(
            rate / 100 * weeks * 0.35,
            1
        )

        direction = "loss"

    elif m["fitness_goal"] == "Muscle Gain":

        estimate = round(
            rate / 100 * weeks * 0.20,
            1
        )

        direction = "gain"

    else:

        estimate = round(
            rate / 100 * weeks * 0.15,
            1
        )

        direction = "progress"

    return render_template(
        "customer.html",

        member=m,

        membership=(
            ms[0]
            if ms
            else None
        ),

        payments=ps,

        att=att,

        rate=rate,

        estimate=estimate,

        direction=direction,

        weeks=weeks
    )


# ---------------------------------------------------------
# START APPLICATION
# ---------------------------------------------------------

if __name__ == "__main__":

    try:

        c = db()

        cur = c.cursor()

        # Admin demo account
        cur.execute(
            """INSERT INTO users(
                username,
                password_hash,
                role,
                member_id
            )

            VALUES(
                %s,
                %s,
                'admin',
                NULL
            )

            ON DUPLICATE KEY UPDATE
                password_hash=VALUES(password_hash),
                member_id=NULL""",

            (
                "admin",
                generate_password_hash(
                    "admin123"
                )
            )
        )

        # Customer demo account
        cur.execute(
            """INSERT INTO users(
                username,
                password_hash,
                role,
                member_id
            )

            VALUES(
                %s,
                %s,
                'customer',
                1
            )

            ON DUPLICATE KEY UPDATE
                password_hash=VALUES(password_hash),
                member_id=1""",

            (
                "yasin",
                generate_password_hash(
                    "yasin123"
                )
            )
        )

        c.commit()

        cur.close()

        c.close()

        print(
            "Database connection and demo accounts ready."
        )

    except Exception as e:

        print(
            "Demo account setup:",
            e
        )

    app.run(debug=True)