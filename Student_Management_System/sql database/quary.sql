
DROP DATABASE IF EXISTS Student_Management_System;
CREATE DATABASE IF NOT EXISTS Student_Management_System;
USE  Student_Management_System;

DROP TABLE IF EXISTS Student;
CREATE TABLE IF NOT EXISTS Student(
                                      student_id VARCHAR(45),
                                      student_name VARCHAR(45),
                                      email TEXT,
                                      contact VARCHAR(20),
                                      address TEXT,
                                      nic VARCHAR(45),
                                      CONSTRAINT PRIMARY KEY (student_id)
);

DROP TABLE IF EXISTS Teacher;
CREATE TABLE IF NOT EXISTS Teacher(
                                      teacher_id VARCHAR(45),
                                      name VARCHAR(45),
                                      nic VARCHAR(45),
                                      contact VARCHAR(45),
                                      address TEXT,
                                      CONSTRAINT PRIMARY KEY (teacher_id)
);

DROP TABLE IF EXISTS Subject;
CREATE TABLE IF NOT EXISTS Subject(
                                      subject_id VARCHAR(45),
                                      subject_name VARCHAR(45),
                                      credit DOUBLE,
                                      teacher_id VARCHAR(45),
                                      CONSTRAINT PRIMARY KEY (subject_id),
                                      CONSTRAINT FOREIGN KEY (teacher_id) REFERENCES Teacher (teacher_id)
                                          ON DELETE CASCADE ON UPDATE CASCADE

);


DROP TABLE IF EXISTS Course;
CREATE TABLE IF NOT EXISTS Course(
                                     course_id VARCHAR(45),
                                     course_name VARCHAR(45),
                                     cost DOUBLE,
                                     duration VARCHAR(45),
                                     subject_id VARCHAR(45),
                                     CONSTRAINT PRIMARY KEY (course_id),
                                     CONSTRAINT FOREIGN KEY (subject_id) REFERENCES Subject (subject_id)
                                         ON DELETE CASCADE ON UPDATE CASCADE

);




DROP TABLE IF EXISTS Intake;
CREATE TABLE IF NOT EXISTS Intake(
                                     intake_id VARCHAR(45),
                                     start_date DATE,
                                     description VARCHAR(45),
                                     course_id VARCHAR(45),
                                     CONSTRAINT PRIMARY KEY (intake_id),
                                     CONSTRAINT FOREIGN KEY (course_id) REFERENCES Course (course_id)
                                         ON DELETE CASCADE ON UPDATE CASCADE

);



DROP TABLE IF EXISTS Registration;
CREATE TABLE IF NOT EXISTS Registration(
                                           registration_id VARCHAR(45),
                                           reg_date DATE,
                                           student_id VARCHAR(45),
                                           intake_id VARCHAR(45),
                                           CONSTRAINT PRIMARY KEY (registration_id),
                                           CONSTRAINT FOREIGN KEY (student_id) REFERENCES Student (student_id)
                                               ON DELETE CASCADE ON UPDATE CASCADE,
                                           CONSTRAINT FOREIGN KEY (intake_id) REFERENCES Intake (intake_id)
                                               ON DELETE CASCADE ON UPDATE CASCADE

);



DROP TABLE IF EXISTS Payment;
CREATE TABLE IF NOT EXISTS Payment(
                                      payment_id VARCHAR(45),
                                      date DATE,


                                      cost DOUBLE,
                                      registration_id VARCHAR(45),
                                      CONSTRAINT PRIMARY KEY (payment_id),
                                      CONSTRAINT FOREIGN KEY (registration_id) REFERENCES Registration (registration_id)
                                          ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Student VALUES ( 'S1','Mahinda','mahinda1@gmail.com','0760000001','mirissa','9958099118V');
INSERT INTO Student VALUES ( 'S2','Ravindu','ravindu@gmail.com','0710000002','kegalle','993330876V');
INSERT INTO Student VALUES ( 'S3','Bimal','bimal@gmail.com','0750000003','diyathalawa','99888652658V');
INSERT INTO Student VALUES ( 'S4','sunil','sunil@gmail.com','0780000004','nugegoda','991123658V');
INSERT INTO Student VALUES ( 'S5','jayantha','jayantha@gmail.com','0760000005','rathnapura','995123658V');

INSERT INTO Teacher VALUES ('T1','Gotabaya','55457859650','0780000011','hambanthota');
INSERT INTO Teacher VALUES ('T2','Mhinda','65457859452','0780000022','beliaththa');
INSERT INTO Teacher VALUES ('T3','Basil','52457859787','0780000033','thissamaharamaya');
INSERT INTO Teacher VALUES ('T4','namal','88457859462','0780000044','jafna');
INSERT INTO Teacher VALUES ('T5','shiranthi','75457859346','0780000055','kilinochchiya');


INSERT INTO Subject VALUES ('SUB1','DBMS',250,'T1');
INSERT INTO Subject VALUES ('SUB2','PRF',270,'T2');
INSERT INTO Subject VALUES ('SUB3','OOP',550,'T3');
INSERT INTO Subject VALUES ('SUB4','HIBERNATE',800,'T4');
INSERT INTO Subject VALUES ('SUB5','JAVA',600,'T5');

INSERT INTO Course VALUES ('C1','GDSE',20000,'1.5years','SUB1');
INSERT INTO Course VALUES ('C2','CMJD',50000,'2years','SUB2');
INSERT INTO Course VALUES ('C3','ICTT',38000,'3years','SUB3');

INSERT INTO Intake VALUES ('IN1','2019-01-05','Start','C1');
INSERT INTO Intake VALUES ('IN2','2019-02-10','Start','C1');
INSERT INTO Intake VALUES ('IN3','2019-05-12','Start','C2');
INSERT INTO Intake VALUES ('IN4','2019-9-20','Start','C1');
INSERT INTO Intake VALUES ('IN5','2019-10-10','Start','C3');

INSERT INTO Registration VALUES ('R1','2019-01-05','S1','IN1');

INSERT INTO Payment VALUES ('P1','2019-06-15',40000,'R1');