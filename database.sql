DROP DATABASE IF EXISTS gym_management;
CREATE DATABASE gym_management;
USE gym_management;

CREATE TABLE trainers (
 trainer_id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 specialization VARCHAR(100),
 phone VARCHAR(20),
 email VARCHAR(120)
);

CREATE TABLE members (
 member_id INT AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 date_of_birth DATE,
 gender VARCHAR(20),
 phone VARCHAR(20),
 email VARCHAR(120),
 address VARCHAR(255),
 emergency_contact VARCHAR(20),
 join_date DATE NOT NULL,
 height DECIMAL(5,2),
 weight DECIMAL(5,2),
 fitness_goal VARCHAR(50),
 blood_group VARCHAR(10),
 trainer_id INT,
 FOREIGN KEY (trainer_id) REFERENCES trainers(trainer_id) ON DELETE SET NULL
);

CREATE TABLE memberships (
 membership_id INT AUTO_INCREMENT PRIMARY KEY,
 member_id INT NOT NULL,
 plan_name VARCHAR(50) NOT NULL,
 start_date DATE NOT NULL,
 end_date DATE NOT NULL,
 fee DECIMAL(10,2) NOT NULL,
 status VARCHAR(20) NOT NULL,
 FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE CASCADE
);

CREATE TABLE payments (
 payment_id INT AUTO_INCREMENT PRIMARY KEY,
 member_id INT NOT NULL,
 amount DECIMAL(10,2) NOT NULL,
 payment_date DATE NOT NULL,
 payment_method VARCHAR(30) NOT NULL,
 FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE CASCADE
);

CREATE TABLE attendance (
 attendance_id INT AUTO_INCREMENT PRIMARY KEY,
 member_id INT NOT NULL,
 attendance_date DATE NOT NULL,
 status VARCHAR(20) NOT NULL,
 FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE CASCADE
);

CREATE TABLE users (
 user_id INT AUTO_INCREMENT PRIMARY KEY,
 username VARCHAR(50) UNIQUE NOT NULL,
 password_hash VARCHAR(255) NOT NULL,
 role VARCHAR(20) NOT NULL,
 member_id INT NULL,
 FOREIGN KEY (member_id) REFERENCES members(member_id) ON DELETE CASCADE
);

INSERT INTO trainers(name,specialization,phone,email) VALUES
('Ravi Kumar','Strength Training','9001000001','ravi@gymfit.com'),
('Priya Menon','Weight Loss','9001000002','priya@gymfit.com'),
('Arun Raj','Cross Training','9001000003','arun@gymfit.com'),
('Meena Joseph','Yoga and Fitness','9001000004','meena@gymfit.com'),
('Vishal S','Bodybuilding','9001000005','vishal@gymfit.com');
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Yasin H','2003-02-02','Male','9876500001','member1@example.com','Coimbatore','9000000001','2026-01-03',156,55,'Weight Loss','B+',1);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Arun K','2004-03-03','Female','9876500002','member2@example.com','Chennai','9000000002','2026-02-06',157,58,'Muscle Gain','O+',2);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Priya S','2005-04-04','Male','9876500003','member3@example.com','Salem','9000000003','2026-03-09',158,61,'Fitness','AB+',3);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Karthik M','2002-05-05','Female','9876500004','member4@example.com','Erode','9000000004','2026-04-12',159,64,'Strength','O-',4);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Divya R','2003-06-06','Male','9876500005','member5@example.com','Madurai','9000000005','2026-05-15',160,67,'Weight Loss','A+',5);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Rahul P','2004-07-07','Female','9876500006','member6@example.com','Tiruppur','9000000006','2026-06-18',161,70,'Muscle Gain','B+',1);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Meena H','2005-08-08','Male','9876500007','member7@example.com','Coimbatore','9000000007','2026-01-21',162,73,'Fitness','O+',2);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Vignesh K','2002-09-09','Female','9876500008','member8@example.com','Chennai','9000000008','2026-02-24',163,76,'Strength','AB+',3);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Anitha S','2003-01-10','Male','9876500009','member9@example.com','Salem','9000000009','2026-03-02',164,79,'Weight Loss','O-',4);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Sanjay M','2004-02-11','Female','9876500010','member10@example.com','Erode','9000000010','2026-04-05',165,82,'Muscle Gain','A+',5);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Ajay R','2005-03-12','Male','9876500011','member11@example.com','Madurai','9000000011','2026-05-08',166,85,'Fitness','B+',1);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Naveen P','2002-04-13','Female','9876500012','member12@example.com','Tiruppur','9000000012','2026-06-11',167,88,'Strength','O+',2);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Surya H','2003-05-14','Male','9876500013','member13@example.com','Coimbatore','9000000013','2026-01-14',168,91,'Weight Loss','AB+',3);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Dinesh K','2004-06-15','Female','9876500014','member14@example.com','Chennai','9000000014','2026-02-17',169,54,'Muscle Gain','O-',4);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Vijay S','2005-07-16','Male','9876500015','member15@example.com','Salem','9000000015','2026-03-20',170,57,'Fitness','A+',5);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Hari M','2002-08-17','Female','9876500016','member16@example.com','Erode','9000000016','2026-04-23',171,60,'Strength','B+',1);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Mohan R','2003-09-18','Male','9876500017','member17@example.com','Madurai','9000000017','2026-05-01',172,63,'Weight Loss','O+',2);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Pranav P','2004-01-19','Female','9876500018','member18@example.com','Tiruppur','9000000018','2026-06-04',173,66,'Muscle Gain','AB+',3);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Rohit H','2005-02-20','Male','9876500019','member19@example.com','Coimbatore','9000000019','2026-01-07',174,69,'Fitness','O-',4);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Sathish K','2002-03-21','Female','9876500020','member20@example.com','Chennai','9000000020','2026-02-10',175,72,'Strength','A+',5);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Keerthana S','2003-04-22','Male','9876500021','member21@example.com','Salem','9000000021','2026-03-13',176,75,'Weight Loss','B+',1);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Harini M','2004-05-23','Female','9876500022','member22@example.com','Erode','9000000022','2026-04-16',177,78,'Muscle Gain','O+',2);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Nithya R','2005-06-24','Male','9876500023','member23@example.com','Madurai','9000000023','2026-05-19',178,81,'Fitness','AB+',3);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Swetha P','2002-07-25','Female','9876500024','member24@example.com','Tiruppur','9000000024','2026-06-22',179,84,'Strength','O-',4);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Lakshmi H','2003-08-01','Male','9876500025','member25@example.com','Coimbatore','9000000025','2026-01-25',180,87,'Weight Loss','A+',5);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Pooja K','2004-09-02','Female','9876500026','member26@example.com','Chennai','9000000026','2026-02-03',155,90,'Muscle Gain','B+',1);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Aishwarya S','2005-01-03','Male','9876500027','member27@example.com','Salem','9000000027','2026-03-06',156,53,'Fitness','O+',2);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Kavya M','2002-02-04','Female','9876500028','member28@example.com','Erode','9000000028','2026-04-09',157,56,'Strength','AB+',3);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Sneha R','2003-03-05','Male','9876500029','member29@example.com','Madurai','9000000029','2026-05-12',158,59,'Weight Loss','O-',4);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Janani P','2004-04-06','Female','9876500030','member30@example.com','Tiruppur','9000000030','2026-06-15',159,62,'Muscle Gain','A+',5);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Ajay H','2005-05-07','Male','9876500031','member31@example.com','Coimbatore','9000000031','2026-01-18',160,65,'Fitness','B+',1);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Naveen K','2002-06-08','Female','9876500032','member32@example.com','Chennai','9000000032','2026-02-21',161,68,'Strength','O+',2);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Surya S','2003-07-09','Male','9876500033','member33@example.com','Salem','9000000033','2026-03-24',162,71,'Weight Loss','AB+',3);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Dinesh M','2004-08-10','Female','9876500034','member34@example.com','Erode','9000000034','2026-04-02',163,74,'Muscle Gain','O-',4);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Vijay R','2005-09-11','Male','9876500035','member35@example.com','Madurai','9000000035','2026-05-05',164,77,'Fitness','A+',5);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Hari P','2002-01-12','Female','9876500036','member36@example.com','Tiruppur','9000000036','2026-06-08',165,80,'Strength','B+',1);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Mohan H','2003-02-13','Male','9876500037','member37@example.com','Coimbatore','9000000037','2026-01-11',166,83,'Weight Loss','O+',2);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Pranav K','2004-03-14','Female','9876500038','member38@example.com','Chennai','9000000038','2026-02-14',167,86,'Muscle Gain','AB+',3);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Rohit S','2005-04-15','Male','9876500039','member39@example.com','Salem','9000000039','2026-03-17',168,89,'Fitness','O-',4);
INSERT INTO members(name,date_of_birth,gender,phone,email,address,emergency_contact,join_date,height,weight,fitness_goal,blood_group,trainer_id)
VALUES ('Sathish M','2002-05-16','Female','9876500040','member40@example.com','Erode','9000000040','2026-04-20',169,52,'Strength','A+',5);
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (1,'Monthly','2026-01-04','2026-02-03',2500,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (1,2500,'2026-01-04', 'Cash');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (2,'Quarterly','2026-02-07','2026-05-08',6500,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (2,6500,'2026-02-07', 'Card');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (3,'Half-Yearly','2026-03-10','2026-09-06',11000,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (3,11000,'2026-03-10', 'Bank Transfer');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (4,'Annual','2026-04-13','2027-04-13',18000,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (4,18000,'2026-04-13', 'UPI');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (5,'Monthly','2026-05-16','2026-06-15',2500,'Expired');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (5,2500,'2026-05-16', 'Cash');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (6,'Quarterly','2026-06-19','2026-09-17',6500,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (6,6500,'2026-06-19', 'Card');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (7,'Half-Yearly','2026-01-02','2026-07-01',11000,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (7,11000,'2026-01-02', 'Bank Transfer');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (8,'Annual','2026-02-05','2027-02-05',18000,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (8,18000,'2026-02-05', 'UPI');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (9,'Monthly','2026-03-08','2026-04-07',2500,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (9,2500,'2026-03-08', 'Cash');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (10,'Quarterly','2026-04-11','2026-07-10',6500,'Expired');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (10,6500,'2026-04-11', 'Card');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (11,'Half-Yearly','2026-05-14','2026-11-10',11000,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (11,11000,'2026-05-14', 'Bank Transfer');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (12,'Annual','2026-06-17','2027-06-17',18000,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (12,18000,'2026-06-17', 'UPI');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (13,'Monthly','2026-01-20','2026-02-19',2500,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (13,2500,'2026-01-20', 'Cash');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (14,'Quarterly','2026-02-03','2026-05-04',6500,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (14,6500,'2026-02-03', 'Card');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (15,'Half-Yearly','2026-03-06','2026-09-02',11000,'Expired');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (15,11000,'2026-03-06', 'Bank Transfer');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (16,'Annual','2026-04-09','2027-04-09',18000,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (16,18000,'2026-04-09', 'UPI');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (17,'Monthly','2026-05-12','2026-06-11',2500,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (17,2500,'2026-05-12', 'Cash');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (18,'Quarterly','2026-06-15','2026-09-13',6500,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (18,6500,'2026-06-15', 'Card');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (19,'Half-Yearly','2026-01-18','2026-07-17',11000,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (19,11000,'2026-01-18', 'Bank Transfer');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (20,'Annual','2026-02-01','2027-02-01',18000,'Expired');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (20,18000,'2026-02-01', 'UPI');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (21,'Monthly','2026-03-04','2026-04-03',2500,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (21,2500,'2026-03-04', 'Cash');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (22,'Quarterly','2026-04-07','2026-07-06',6500,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (22,6500,'2026-04-07', 'Card');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (23,'Half-Yearly','2026-05-10','2026-11-06',11000,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (23,11000,'2026-05-10', 'Bank Transfer');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (24,'Annual','2026-06-13','2027-06-13',18000,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (24,18000,'2026-06-13', 'UPI');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (25,'Monthly','2026-01-16','2026-02-15',2500,'Expired');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (25,2500,'2026-01-16', 'Cash');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (26,'Quarterly','2026-02-19','2026-05-20',6500,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (26,6500,'2026-02-19', 'Card');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (27,'Half-Yearly','2026-03-02','2026-08-29',11000,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (27,11000,'2026-03-02', 'Bank Transfer');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (28,'Annual','2026-04-05','2027-04-05',18000,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (28,18000,'2026-04-05', 'UPI');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (29,'Monthly','2026-05-08','2026-06-07',2500,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (29,2500,'2026-05-08', 'Cash');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (30,'Quarterly','2026-06-11','2026-09-09',6500,'Expired');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (30,6500,'2026-06-11', 'Card');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (31,'Half-Yearly','2026-01-14','2026-07-13',11000,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (31,11000,'2026-01-14', 'Bank Transfer');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (32,'Annual','2026-02-17','2027-02-17',18000,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (32,18000,'2026-02-17', 'UPI');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (33,'Monthly','2026-03-20','2026-04-19',2500,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (33,2500,'2026-03-20', 'Cash');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (34,'Quarterly','2026-04-03','2026-07-02',6500,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (34,6500,'2026-04-03', 'Card');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (35,'Half-Yearly','2026-05-06','2026-11-02',11000,'Expired');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (35,11000,'2026-05-06', 'Bank Transfer');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (36,'Annual','2026-06-09','2027-06-09',18000,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (36,18000,'2026-06-09', 'UPI');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (37,'Monthly','2026-01-12','2026-02-11',2500,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (37,2500,'2026-01-12', 'Cash');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (38,'Quarterly','2026-02-15','2026-05-16',6500,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (38,6500,'2026-02-15', 'Card');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (39,'Half-Yearly','2026-03-18','2026-09-14',11000,'Active');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (39,11000,'2026-03-18', 'Bank Transfer');
INSERT INTO memberships(member_id,plan_name,start_date,end_date,fee,status) VALUES (40,'Annual','2026-04-01','2027-04-01',18000,'Expired');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES (40,18000,'2026-04-01', 'UPI');
INSERT INTO payments(member_id,amount,payment_date,payment_method) VALUES
(1,3000,CURDATE(),'UPI'),
(2,2500,CURDATE(),'Card'),
(3,6500,DATE_SUB(CURDATE(),INTERVAL 2 DAY),'UPI'),
(4,2500,DATE_SUB(CURDATE(),INTERVAL 5 DAY),'Cash');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (1,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (1,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (1,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (1,'2026-09-23','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (1,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (1,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (1,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (1,'2026-09-27','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (1,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (1,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (2,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (2,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (2,'2026-09-22','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (2,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (2,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (2,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (2,'2026-09-26','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (2,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (2,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (2,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (3,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (3,'2026-09-21','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (3,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (3,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (3,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (3,'2026-09-25','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (3,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (3,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (3,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (3,'2026-09-29','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (4,'2026-09-20','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (4,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (4,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (4,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (4,'2026-09-24','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (4,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (4,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (4,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (4,'2026-09-28','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (4,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (5,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (5,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (5,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (5,'2026-09-23','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (5,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (5,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (5,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (5,'2026-09-27','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (5,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (5,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (6,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (6,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (6,'2026-09-22','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (6,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (6,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (6,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (6,'2026-09-26','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (6,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (6,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (6,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (7,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (7,'2026-09-21','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (7,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (7,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (7,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (7,'2026-09-25','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (7,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (7,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (7,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (7,'2026-09-29','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (8,'2026-09-20','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (8,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (8,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (8,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (8,'2026-09-24','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (8,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (8,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (8,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (8,'2026-09-28','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (8,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (9,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (9,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (9,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (9,'2026-09-23','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (9,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (9,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (9,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (9,'2026-09-27','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (9,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (9,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (10,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (10,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (10,'2026-09-22','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (10,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (10,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (10,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (10,'2026-09-26','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (10,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (10,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (10,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (11,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (11,'2026-09-21','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (11,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (11,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (11,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (11,'2026-09-25','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (11,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (11,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (11,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (11,'2026-09-29','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (12,'2026-09-20','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (12,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (12,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (12,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (12,'2026-09-24','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (12,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (12,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (12,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (12,'2026-09-28','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (12,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (13,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (13,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (13,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (13,'2026-09-23','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (13,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (13,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (13,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (13,'2026-09-27','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (13,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (13,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (14,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (14,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (14,'2026-09-22','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (14,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (14,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (14,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (14,'2026-09-26','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (14,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (14,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (14,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (15,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (15,'2026-09-21','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (15,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (15,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (15,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (15,'2026-09-25','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (15,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (15,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (15,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (15,'2026-09-29','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (16,'2026-09-20','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (16,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (16,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (16,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (16,'2026-09-24','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (16,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (16,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (16,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (16,'2026-09-28','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (16,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (17,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (17,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (17,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (17,'2026-09-23','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (17,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (17,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (17,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (17,'2026-09-27','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (17,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (17,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (18,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (18,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (18,'2026-09-22','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (18,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (18,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (18,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (18,'2026-09-26','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (18,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (18,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (18,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (19,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (19,'2026-09-21','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (19,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (19,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (19,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (19,'2026-09-25','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (19,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (19,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (19,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (19,'2026-09-29','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (20,'2026-09-20','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (20,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (20,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (20,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (20,'2026-09-24','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (20,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (20,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (20,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (20,'2026-09-28','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (20,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (21,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (21,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (21,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (21,'2026-09-23','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (21,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (21,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (21,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (21,'2026-09-27','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (21,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (21,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (22,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (22,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (22,'2026-09-22','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (22,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (22,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (22,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (22,'2026-09-26','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (22,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (22,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (22,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (23,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (23,'2026-09-21','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (23,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (23,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (23,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (23,'2026-09-25','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (23,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (23,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (23,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (23,'2026-09-29','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (24,'2026-09-20','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (24,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (24,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (24,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (24,'2026-09-24','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (24,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (24,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (24,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (24,'2026-09-28','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (24,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (25,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (25,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (25,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (25,'2026-09-23','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (25,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (25,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (25,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (25,'2026-09-27','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (25,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (25,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (26,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (26,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (26,'2026-09-22','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (26,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (26,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (26,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (26,'2026-09-26','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (26,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (26,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (26,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (27,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (27,'2026-09-21','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (27,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (27,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (27,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (27,'2026-09-25','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (27,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (27,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (27,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (27,'2026-09-29','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (28,'2026-09-20','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (28,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (28,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (28,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (28,'2026-09-24','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (28,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (28,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (28,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (28,'2026-09-28','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (28,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (29,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (29,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (29,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (29,'2026-09-23','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (29,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (29,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (29,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (29,'2026-09-27','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (29,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (29,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (30,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (30,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (30,'2026-09-22','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (30,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (30,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (30,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (30,'2026-09-26','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (30,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (30,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (30,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (31,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (31,'2026-09-21','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (31,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (31,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (31,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (31,'2026-09-25','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (31,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (31,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (31,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (31,'2026-09-29','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (32,'2026-09-20','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (32,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (32,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (32,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (32,'2026-09-24','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (32,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (32,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (32,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (32,'2026-09-28','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (32,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (33,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (33,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (33,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (33,'2026-09-23','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (33,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (33,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (33,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (33,'2026-09-27','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (33,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (33,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (34,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (34,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (34,'2026-09-22','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (34,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (34,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (34,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (34,'2026-09-26','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (34,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (34,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (34,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (35,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (35,'2026-09-21','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (35,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (35,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (35,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (35,'2026-09-25','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (35,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (35,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (35,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (35,'2026-09-29','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (36,'2026-09-20','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (36,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (36,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (36,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (36,'2026-09-24','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (36,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (36,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (36,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (36,'2026-09-28','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (36,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (37,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (37,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (37,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (37,'2026-09-23','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (37,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (37,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (37,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (37,'2026-09-27','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (37,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (37,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (38,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (38,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (38,'2026-09-22','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (38,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (38,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (38,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (38,'2026-09-26','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (38,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (38,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (38,'2026-09-29','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (39,'2026-09-20','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (39,'2026-09-21','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (39,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (39,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (39,'2026-09-24','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (39,'2026-09-25','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (39,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (39,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (39,'2026-09-28','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (39,'2026-09-29','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (40,'2026-09-20','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (40,'2026-09-21','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (40,'2026-09-22','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (40,'2026-09-23','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (40,'2026-09-24','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (40,'2026-09-25','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (40,'2026-09-26','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (40,'2026-09-27','Present');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (40,'2026-09-28','Absent');
INSERT INTO attendance(member_id,attendance_date,status) VALUES (40,'2026-09-29','Present');
