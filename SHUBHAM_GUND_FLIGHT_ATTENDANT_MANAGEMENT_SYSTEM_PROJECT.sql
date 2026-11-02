-- Q1.DATABASE CREATION.
CREATE DATABASE FLIGHT_ATTENDANT_MANAGEMENT;

-- Q2.USE THE DATABASE.
USE FLIGHT_ATTENDANT_MANAGEMENT;

-- Q3. CREATE TABLE DEPARTMENT AND INSERT VALUES IN IT .
CREATE TABLE DEPARTMENT (
DEPARTMENT_ID INT PRIMARY KEY,
DEPARTMENT_NAME VARCHAR(50) NOT NULL UNIQUE,
MANAGER_NAME VARCHAR(50) NOT NULL,
LOCATION VARCHAR(50) DEFAULT 'MUMBAI',
BUDGET DECIMAL(12,2) CHECK (BUDGET > 0)
);

INSERT INTO DEPARTMENT
(DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_NAME, LOCATION, BUDGET)
VALUES
(101, 'Cabin Crew', 'Rajesh Sharma', 'Mumbai', 850000.00),
(102, 'Flight Operations', 'Amit Verma', 'Delhi', 1200000.00),
(103, 'Human Resources', 'Priya Mehta', 'Mumbai', 650000.00),
(104, 'Training', 'Neha Kapoor', 'Bangalore', 900000.00),
(105, 'Customer Service', 'Rohit Patil', 'Pune', 550000.00),
(106, 'Safety and Security', 'Sanjay Rao', 'Hyderabad', 1000000.00),
(107, 'Ground Operations', 'Anita Singh', 'Delhi', 750000.00),
(108, 'Finance', 'Karan Shah', 'Mumbai', 950000.00),
(109, 'Maintenance', 'Vikram Joshi', 'Chennai', 1500000.00),
(110, 'Administration', 'Pooja Nair', 'Kochi', 500000.00);

SELECT * FROM DEPARTMENT;

--  Q4.CREATE TABLE AIRPORT AND INSERT VALUES IN IT.

CREATE TABLE AIRPORT (
    AIRPORT_ID INT PRIMARY KEY,
    AIRPORT_CODE CHAR(3) NOT NULL UNIQUE,
    AIRPORT_NAME VARCHAR(100) NOT NULL,
    CITY VARCHAR(50) NOT NULL,
    COUNTRY VARCHAR(50) DEFAULT 'INDIA',
    TERMINALS TINYINT CHECK (TERMINALS > 0),
    ESTABLISHED_DATE DATE
);

INSERT INTO AIRPORT
(AIRPORT_ID, AIRPORT_CODE, AIRPORT_NAME, CITY, COUNTRY, TERMINALS, ESTABLISHED_DATE)
VALUES
(201, 'BOM', 'Chhatrapati Shivaji Maharaj International Airport', 'Mumbai', 'India', 2, '1928-03-01'),
(202, 'DEL', 'Indira Gandhi International Airport', 'Delhi', 'India', 3, '1930-07-01'),
(203, 'BLR', 'Kempegowda International Airport', 'Bangalore', 'India', 2, '2008-05-24'),
(204, 'HYD', 'Rajiv Gandhi International Airport', 'Hyderabad', 'India', 2, '2008-03-23'),
(205, 'MAA', 'Chennai International Airport', 'Chennai', 'India', 2, '1910-02-01'),
(206, 'CCU', 'Netaji Subhas Chandra Bose International Airport', 'Kolkata', 'India', 2, '1924-12-01'),
(207, 'PNQ', 'Pune International Airport', 'Pune', 'India', 1, '1939-01-01'),
(208, 'GOI', 'Manohar International Airport', 'Goa', 'India', 1, '2022-01-05'),
(209, 'COK', 'Cochin International Airport', 'Kochi', 'India', 3, '1999-06-10'),
(210, 'AMD', 'Sardar Vallabhbhai Patel International Airport', 'Ahmedabad', 'India', 2, '1937-01-01');

SELECT * FROM AIRPORT;

-- Q5. CREATE FLIGHT TABLE AND INSERT VALUES IN IT.
CREATE TABLE FLIGHT (
FLIGHT_ID INT PRIMARY KEY,
FLIGHT_NUMBER VARCHAR(10) NOT NULL UNIQUE,
LINE_NAME VARCHAR(50) NOT NULL,
SOURCE_AIRPORT_ID INT,
DESTINATION_AIRPORT_ID INT,
AIRCRAFT_MODEL VARCHAR(50) NOT NULL,
FLIGHT_TYPE VARCHAR(20) DEFAULT 'DOMESTIC',
DURATION_MINUTES SMALLINT CHECK (DURATION_MINUTES > 0),
FOREIGN KEY (SOURCE_AIRPORT_ID)
REFERENCES AIRPORT(AIRPORT_ID),
FOREIGN KEY (DESTINATION_AIRPORT_ID)
REFERENCES AIRPORT(AIRPORT_ID)
);

INSERT INTO FLIGHT      -- LINE NAME IS AIRLINE NAME OK.
(FLIGHT_ID, FLIGHT_NUMBER, LINE_NAME, SOURCE_AIRPORT_ID,
 DESTINATION_AIRPORT_ID, AIRCRAFT_MODEL, FLIGHT_TYPE, DURATION_MINUTES)
VALUES
(301, 'AI101', 'Air India', 201, 202, 'Airbus A320', 'DOMESTIC', 135),
(302, '6E202', 'IndiGo', 202, 203, 'Airbus A321', 'DOMESTIC', 160),
(303, 'UK303', 'Vistara', 201, 204, 'Airbus A320', 'DOMESTIC', 115),
(304, 'AI404', 'Air India', 203, 205, 'Boeing 787', 'DOMESTIC', 105),
(305, '6E505', 'IndiGo', 204, 206, 'Airbus A320', 'DOMESTIC', 125),
(306, 'AI606', 'Air India', 205, 201, 'Airbus A321', 'DOMESTIC', 120),
(307, '6E707', 'IndiGo', 206, 207, 'Airbus A320', 'DOMESTIC', 135),
(308, 'UK808', 'Vistara', 201, 209, 'Airbus A321', 'DOMESTIC', 150),
(309, 'AI909', 'Air India', 202, 210, 'Boeing 787', 'DOMESTIC', 130),
(310, '6E010', 'IndiGo', 209, 201, 'Airbus A320', 'DOMESTIC', 155);

-- Q6. CREATE FLIGHT_SCHEDULE TABLE AND INSERT VALUES IN IT.

CREATE TABLE FLIGHT_SCHEDULE (
SCHEDULE_ID INT PRIMARY KEY,
FLIGHT_ID INT NOT NULL,
DEPARTURE_TIME DATETIME NOT NULL,
ARRIVAL_TIME DATETIME NOT NULL,
GATE_NUMBER VARCHAR(10),
STATUS VARCHAR(20) DEFAULT 'SCHEDULED',
AVAILABLE_SEATS SMALLINT CHECK (AVAILABLE_SEATS >= 0),
FOREIGN KEY (FLIGHT_ID)
REFERENCES FLIGHT(FLIGHT_ID)
);

INSERT INTO FLIGHT_SCHEDULE
(SCHEDULE_ID, FLIGHT_ID, DEPARTURE_TIME, ARRIVAL_TIME,
 GATE_NUMBER, STATUS, AVAILABLE_SEATS)
VALUES
(401, 301, '2026-09-21 06:30:00', '2026-09-21 08:45:00', 'G01', 'SCHEDULED', 120),
(402, 302, '2026-09-21 09:00:00', '2026-09-21 11:40:00', 'G02', 'SCHEDULED', 150),
(403, 303, '2026-09-21 11:30:00', '2026-09-21 13:25:00', 'G03', 'BOARDING', 110),
(404, 304, '2026-09-21 14:00:00', '2026-09-21 15:45:00', 'G04', 'SCHEDULED', 180),
(405, 305, '2026-09-22 07:15:00', '2026-09-22 09:20:00', 'G05', 'SCHEDULED', 130),
(406, 306, '2026-09-22 10:00:00', '2026-09-22 12:00:00', 'G06', 'DELAYED', 95),
(407, 307, '2026-09-22 13:30:00', '2026-09-22 15:45:00', 'G07', 'SCHEDULED', 140),
(408, 308, '2026-09-23 08:00:00', '2026-09-23 10:30:00', 'G08', 'SCHEDULED', 125),
(409, 309, '2026-09-23 16:00:00', '2026-09-23 18:10:00', 'G09', 'CANCELLED', 0),
(410, 310, '2026-09-24 18:30:00', '2026-09-24 21:05:00', 'G10', 'SCHEDULED', 160);

SELECT * FROM FLIGHT_SCHEDULE;

-- Q7. CREATE FLIGHT_ATTENDANT TABLE AND INSERT VALUES IN IT.
CREATE TABLE FLIGHT_ATTENDANT (
ATTENDANT_ID INT PRIMARY KEY,
ATTENDANT_NAME VARCHAR(60) NOT NULL,
GENDER CHAR(1) CHECK (GENDER IN ('M', 'F')),
EMAIL VARCHAR(100) UNIQUE,
PHONE VARCHAR(15) UNIQUE,
DATE_OF_BIRTH DATE NOT NULL,
HIRE_DATE DATE NOT NULL,
SALARY DECIMAL(10,2) CHECK (SALARY > 0),
DEPARTMENT_ID INT,
STATUS VARCHAR(20) DEFAULT 'ACTIVE',
FOREIGN KEY (DEPARTMENT_ID)
REFERENCES DEPARTMENT(DEPARTMENT_ID)
);

INSERT INTO FLIGHT_ATTENDANT
(ATTENDANT_ID, ATTENDANT_NAME, GENDER, EMAIL, PHONE,
 DATE_OF_BIRTH, HIRE_DATE, SALARY, DEPARTMENT_ID, STATUS)
VALUES
(501, 'Aarav Sharma', 'M', 'aarav.sharma@gmail.com', '9876500001',
 '1995-04-12', '2020-06-15', 65000.00, 101, 'ACTIVE'),

(502, 'Priya Nair', 'F', 'priya.nair@gmail.com', '9876500002',
 '1997-08-21', '2021-03-10', 58000.00, 101, 'ACTIVE'),

(503, 'Rohan Mehta', 'M', 'rohan.mehta@gmail.com', '9876500003',
 '1994-11-05', '2019-01-20', 72000.00, 101, 'ACTIVE'),

(504, 'Sneha Patil', 'F', 'sneha.patil@gmail.com', '9876500004',
 '1998-02-17', '2022-07-01', 52000.00, 104, 'ACTIVE'),

(505, 'Vivek Rao', 'M', 'vivek.rao@gmail.com', '9876500005',
 '1993-06-30', '2018-09-12', 78000.00, 101, 'ACTIVE'),

(506, 'Ananya Singh', 'F', 'ananya.singh@gmail.com', '9876500006',
 '1996-12-10', '2020-11-18', 68000.00, 104, 'ACTIVE'),

(507, 'Kunal Shah', 'M', 'kunal.shah@gmail.com', '9876500007',
 '1995-09-25', '2021-05-22', 61000.00, 101, 'ON LEAVE'),

(508, 'Meera Joshi', 'F', 'meera.joshi@gmail.com', '9876500008',
 '1999-01-14', '2023-02-06', 50000.00, 104, 'ACTIVE'),

(509, 'Aditya Kapoor', 'M', 'aditya.kapoor@gmail.com', '9876500009',
 '1992-03-08', '2017-04-17', 85000.00, 101, 'ACTIVE'),

(510, 'Isha Verma', 'F', 'isha.verma@gmail.com', '9876500010',
 '1997-07-19', '2022-10-03', 55000.00, 104, 'INACTIVE');
 
 SELECT * FROM FLIGHT_ATTENDANT;
 
 -- Q8. CREATE ATTENDANT_ASSIGNMENT TABLE AND INSERT VALUES IN IT.

CREATE TABLE ATTENDANT_ASSIGNMENT (
ASSIGNMENT_ID INT PRIMARY KEY,
ATTENDANT_ID INT NOT NULL,
FLIGHT_ID INT NOT NULL,
SCHEDULE_ID INT,
ASSIGNMENT_DATE DATE NOT NULL,
ROLE VARCHAR(30) DEFAULT 'CABIN CREW',
DUTY_HOURS DECIMAL(4,2) CHECK (DUTY_HOURS > 0),
FOREIGN KEY (ATTENDANT_ID)
REFERENCES FLIGHT_ATTENDANT(ATTENDANT_ID),
FOREIGN KEY (FLIGHT_ID)
REFERENCES FLIGHT(FLIGHT_ID),
FOREIGN KEY (SCHEDULE_ID)
REFERENCES FLIGHT_SCHEDULE(SCHEDULE_ID)
);

INSERT INTO ATTENDANT_ASSIGNMENT
(ASSIGNMENT_ID, ATTENDANT_ID, FLIGHT_ID, SCHEDULE_ID,
 ASSIGNMENT_DATE, ROLE, DUTY_HOURS)
VALUES
(601, 501, 301, 401, '2026-09-21', 'SENIOR CREW', 4.50),
(602, 502, 301, 401, '2026-09-21', 'CABIN CREW', 4.50),
(603, 503, 302, 402, '2026-09-21', 'SENIOR CREW', 5.00),
(604, 504, 302, 402, '2026-09-21', 'CABIN CREW', 5.00),
(605, 505, 303, 403, '2026-09-21', 'SENIOR CREW', 4.00),
(606, 506, 304, 404, '2026-09-21', 'CABIN CREW', 3.75),
(607, 507, 305, 405, '2026-09-22', 'CABIN CREW', 4.25),
(608, 508, 306, 406, '2026-09-22', 'CABIN CREW', 4.00),
(609, 509, 307, 407, '2026-09-22', 'SENIOR CREW', 4.50),
(610, 510, 308, 408, '2026-09-23', 'CABIN CREW', 5.25);

SELECT * FROM ATTENDANT_ASSIGNMENT;

-- Q9. CREATE PASSENGER TABLE AND INSERT VALUES IN IT.

CREATE TABLE PASSENGER (
PASSENGER_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR(40) NOT NULL,
LAST_NAME VARCHAR(40) NOT NULL,
GENDER CHAR(1) CHECK (GENDER IN ('M', 'F')),
EMAIL VARCHAR(100) UNIQUE,
PHONE VARCHAR(15),
CITY VARCHAR(50) NOT NULL,
DATE_OF_BIRTH DATE NOT NULL,
PASSPORT_NUMBER VARCHAR(20) UNIQUE
);

INSERT INTO PASSENGER
(PASSENGER_ID, FIRST_NAME, LAST_NAME, GENDER, EMAIL, PHONE,
 CITY, DATE_OF_BIRTH, PASSPORT_NUMBER)
VALUES
(701, 'Rahul', 'Sharma', 'M', 'rahul.sharma@gmail.com', '9876510001',
 'Mumbai', '1995-03-15', 'P10001'),

(702, 'Sneha', 'Patil', 'F', 'sneha.patil@gmail.com', '9876510002',
 'Pune', '1998-07-22', 'P10002'),

(703, 'Arjun', 'Mehta', 'M', 'arjun.mehta@gmail.com', '9876510003',
 'Delhi', '1993-11-10', 'P10003'),

(704, 'Priya', 'Nair', 'F', 'priya.nair@gmail.com', '9876510004',
 'Mumbai', '1997-01-28', 'P10004'),

(705, 'Vikram', 'Rao', 'M', 'vikram.rao@gmail.com', '9876510005',
 'Hyderabad', '1990-05-19', 'P10005'),

(706, 'Ananya', 'Singh', 'F', 'ananya.singh@gmail.com', '9876510006',
 'Delhi', '1996-09-03', 'P10006'),

(707, 'Karan', 'Shah', 'M', 'karan.shah@gmail.com', '9876510007',
 'Ahmedabad', '1994-12-14', 'P10007'),

(708, 'Meera', 'Joshi', 'F', 'meera.joshi@gmail.com', '9876510008',
 'Mumbai', '1999-06-25', 'P10008'),

(709, 'Aditya', 'Kapoor', 'M', 'aditya.kapoor@gmail.com', '9876510009',
 'Pune', '1992-02-08', 'P10009'),

(710, 'Isha', 'Verma', 'F', 'isha.verma@gmail.com', '9876510010',
 'Kolkata', '1997-10-30', 'P10010');
 
 SELECT * FROM PASSENGER;
 
 -- Q10. CREATE BOOKING TABLE AND INSERT VALUES IN IT.

CREATE TABLE BOOKING (
BOOKING_ID INT PRIMARY KEY,
PASSENGER_ID INT NOT NULL,
FLIGHT_ID INT NOT NULL,
BOOKING_DATE DATE NOT NULL,
JOURNEY_DATE DATE NOT NULL,
SEAT_NUMBER VARCHAR(10) NOT NULL,
FARE DECIMAL(10,2) CHECK (FARE > 0),
BOOKING_STATUS VARCHAR(20) DEFAULT 'CONFIRMED',
FOREIGN KEY (PASSENGER_ID)
REFERENCES PASSENGER(PASSENGER_ID),
FOREIGN KEY (FLIGHT_ID)
REFERENCES FLIGHT(FLIGHT_ID)
);

INSERT INTO BOOKING
(BOOKING_ID, PASSENGER_ID, FLIGHT_ID, BOOKING_DATE,
 JOURNEY_DATE, SEAT_NUMBER, FARE, BOOKING_STATUS)
VALUES
(801, 701, 301, '2026-09-10', '2026-09-21', '12A', 5500.00, 'CONFIRMED'),
(802, 702, 302, '2026-09-11', '2026-09-21', '15B', 6200.00, 'CONFIRMED'),
(803, 703, 303, '2026-09-12', '2026-09-21', '08C', 4800.00, 'CONFIRMED'),
(804, 704, 304, '2026-09-13', '2026-09-21', '21A', 7500.00, 'CONFIRMED'),
(805, 705, 305, '2026-09-14', '2026-09-22', '10D', 5200.00, 'CONFIRMED'),
(806, 706, 306, '2026-09-15', '2026-09-22', '18B', 6800.00, 'CONFIRMED'),
(807, 707, 307, '2026-09-16', '2026-09-22', '14A', 4500.00, 'CONFIRMED'),
(808, 708, 308, '2026-09-17', '2026-09-23', '09C', 7100.00, 'CANCELLED'),
(809, 709, 309, '2026-09-18', '2026-09-23', '16D', 8000.00, 'CONFIRMED'),
(810, 710, 310, '2026-09-19', '2026-09-24', '11A', 5900.00, 'CONFIRMED');

SELECT* FROM BOOKING;

-- Q11. CREATE PAYMENT TABLE AND INSERT VALUES IN IT.

CREATE TABLE PAYMENT (
PAYMENT_ID INT PRIMARY KEY,
BOOKING_ID INT NOT NULL,
PAYMENT_DATE DATE NOT NULL,
AMOUNT DECIMAL(10,2) CHECK (AMOUNT > 0),
PAYMENT_METHOD VARCHAR(20) NOT NULL,
PAYMENT_STATUS VARCHAR(20) DEFAULT 'SUCCESS',
TRANSACTION_REFERENCE VARCHAR(30) UNIQUE,
FOREIGN KEY (BOOKING_ID)
REFERENCES BOOKING(BOOKING_ID)
);

INSERT INTO PAYMENT
(PAYMENT_ID, BOOKING_ID, PAYMENT_DATE, AMOUNT,
 PAYMENT_METHOD, PAYMENT_STATUS, TRANSACTION_REFERENCE)
VALUES
(901, 801, '2026-09-10', 5500.00, 'UPI', 'SUCCESS', 'TXN10001'),
(902, 802, '2026-09-11', 6200.00, 'CARD', 'SUCCESS', 'TXN10002'),
(903, 803, '2026-09-12', 4800.00, 'UPI', 'SUCCESS', 'TXN10003'),
(904, 804, '2026-09-13', 7500.00, 'NET BANKING', 'SUCCESS', 'TXN10004'),
(905, 805, '2026-09-14', 5200.00, 'CARD', 'SUCCESS', 'TXN10005'),
(906, 806, '2026-09-15', 6800.00, 'UPI', 'SUCCESS', 'TXN10006'),
(907, 807, '2026-09-16', 4500.00, 'CASH', 'SUCCESS', 'TXN10007'),
(908, 808, '2026-09-17', 7100.00, 'CARD', 'REFUNDED', 'TXN10008'),
(909, 809, '2026-09-18', 8000.00, 'UPI', 'SUCCESS', 'TXN10009'),
(910, 810, '2026-09-19', 5900.00, 'NET BANKING', 'SUCCESS', 'TXN10010');

SELECT * FROM PAYMENT;

-- Q12. CREATE ATTENDANT_CERTIFICATION TABLE AND INSERT VALUES IN IT.

CREATE TABLE ATTENDANT_CERTIFICATION (
CERTIFICATION_ID INT PRIMARY KEY,
ATTENDANT_ID INT NOT NULL,
CERTIFICATION_NAME VARCHAR(60) NOT NULL,
ISSUE_DATE DATE NOT NULL,
EXPIRY_DATE DATE NOT NULL,
CERTIFICATION_LEVEL VARCHAR(20) DEFAULT 'STANDARD',
SCORE DECIMAL(5,2) CHECK (SCORE BETWEEN 0 AND 100),
FOREIGN KEY (ATTENDANT_ID)
REFERENCES FLIGHT_ATTENDANT(ATTENDANT_ID)
);

INSERT INTO ATTENDANT_CERTIFICATION
(CERTIFICATION_ID, ATTENDANT_ID, CERTIFICATION_NAME,
 ISSUE_DATE, EXPIRY_DATE, CERTIFICATION_LEVEL, SCORE)
VALUES
(1001, 501, 'Cabin Safety Training', '2024-06-10', '2027-06-10', 'ADVANCED', 92.50),
(1002, 502, 'First Aid Certification', '2024-08-15', '2027-08-15', 'STANDARD', 88.00),
(1003, 503, 'Emergency Procedures', '2023-11-20', '2026-11-20', 'ADVANCED', 95.00),
(1004, 504, 'Cabin Safety Training', '2025-01-12', '2028-01-12', 'STANDARD', 84.50),
(1005, 505, 'First Aid Certification', '2024-03-18', '2027-03-18', 'ADVANCED', 91.00),
(1006, 506, 'Emergency Procedures', '2024-09-05', '2027-09-05', 'STANDARD', 87.50),
(1007, 507, 'Cabin Safety Training', '2023-12-10', '2026-12-10', 'STANDARD', 82.00),
(1008, 508, 'First Aid Certification', '2025-02-22', '2028-02-22', 'ADVANCED', 94.00),
(1009, 509, 'Emergency Procedures', '2023-07-14', '2026-07-14', 'ADVANCED', 96.50),
(1010, 510, 'Cabin Safety Training', '2025-04-01', '2028-04-01', 'STANDARD', 80.00);

SELECT * FROM ATTENDANT_CERTIFICATION;

-- Q13. CREATE CREW_TRAINING TABLE AND INSERT VALUES IN IT.

CREATE TABLE CREW_TRAINING (
TRAINING_ID INT PRIMARY KEY,
ATTENDANT_ID INT NOT NULL,
TRAINING_NAME VARCHAR(60) NOT NULL,
TRAINING_DATE DATE NOT NULL,
TRAINING_TYPE VARCHAR(30) DEFAULT 'SAFETY',
SCORE DECIMAL(5,2) CHECK (SCORE BETWEEN 0 AND 100),
TRAINING_STATUS VARCHAR(20) DEFAULT 'COMPLETED',
FOREIGN KEY (ATTENDANT_ID)
REFERENCES FLIGHT_ATTENDANT(ATTENDANT_ID)
);

INSERT INTO CREW_TRAINING
(TRAINING_ID, ATTENDANT_ID, TRAINING_NAME, TRAINING_DATE,
 TRAINING_TYPE, SCORE, TRAINING_STATUS)
VALUES
(1101, 501, 'Emergency Response', '2025-01-15', 'SAFETY', 91.00, 'COMPLETED'),
(1102, 502, 'First Aid', '2025-02-10', 'MEDICAL', 88.50, 'COMPLETED'),
(1103, 503, 'Fire Safety', '2025-03-05', 'SAFETY', 94.00, 'COMPLETED'),
(1104, 504, 'Customer Service', '2025-04-12', 'SERVICE', 86.00, 'COMPLETED'),
(1105, 505, 'Emergency Response', '2025-05-18', 'SAFETY', 96.00, 'COMPLETED'),
(1106, 506, 'First Aid', '2025-06-20', 'MEDICAL', 89.50, 'COMPLETED'),
(1107, 507, 'Fire Safety', '2025-07-08', 'SAFETY', 82.00, 'COMPLETED'),
(1108, 508, 'Customer Service', '2025-08-14', 'SERVICE', 90.00, 'COMPLETED'),
(1109, 509, 'Emergency Response', '2025-09-02', 'SAFETY', 97.00, 'COMPLETED'),
(1110, 510, 'First Aid', '2025-09-10', 'MEDICAL', 81.50, 'PENDING');

-- Q14. CREATE FLIGHT_INCIDENT TABLE AND INSERT VALUES IN IT.

CREATE TABLE FLIGHT_INCIDENT (
INCIDENT_ID INT PRIMARY KEY,
FLIGHT_ID INT NOT NULL,
ATTENDANT_ID INT,
INCIDENT_DATE DATE NOT NULL,
INCIDENT_TYPE VARCHAR(40) NOT NULL,
SEVERITY VARCHAR(15) CHECK (SEVERITY IN ('LOW', 'MEDIUM', 'HIGH')),
DESCRIPTION VARCHAR(200),
STATUS VARCHAR(20) DEFAULT 'OPEN',
FOREIGN KEY (FLIGHT_ID)
REFERENCES FLIGHT(FLIGHT_ID),
FOREIGN KEY (ATTENDANT_ID)
REFERENCES FLIGHT_ATTENDANT(ATTENDANT_ID)
);

INSERT INTO FLIGHT_INCIDENT
(INCIDENT_ID, FLIGHT_ID, ATTENDANT_ID, INCIDENT_DATE,
 INCIDENT_TYPE, SEVERITY, DESCRIPTION, STATUS)
VALUES
(1201, 301, 501, '2026-09-21', 'Medical Emergency', 'HIGH', 'Passenger required medical assistance', 'RESOLVED'),
(1202, 301, 502, '2026-09-21', 'Seat Dispute', 'LOW', 'Passengers disagreed over assigned seats', 'RESOLVED'),
(1203, 302, 503, '2026-09-21', 'Turbulence', 'MEDIUM', 'Unexpected severe turbulence during flight', 'RESOLVED'),
(1204, 302, 504, '2026-09-21', 'Lost Item', 'LOW', 'Passenger reported a missing handbag', 'OPEN'),
(1205, 303, 505, '2026-09-21', 'Medical Emergency', 'HIGH', 'Passenger became unwell during flight', 'RESOLVED'),
(1206, 304, 506, '2026-09-21', 'Passenger Dispute', 'MEDIUM', 'Verbal disagreement between passengers', 'RESOLVED'),
(1207, 305, 507, '2026-09-22', 'Turbulence', 'MEDIUM', 'Strong turbulence reported', 'OPEN'),
(1208, 306, 508, '2026-09-22', 'Lost Item', 'LOW', 'Passenger reported lost headphones', 'RESOLVED'),
(1209, 307, 509, '2026-09-22', 'Medical Emergency', 'HIGH', 'First aid assistance was provided', 'RESOLVED'),
(1210, 308, 510, '2026-09-23', 'Seat Dispute', 'LOW', 'Passenger requested seat change', 'OPEN');

SELECT * FROM FLIGHT_INCIDENT;

SHOW TABLES; -- CHECKING TABLES 

-- TOTAL RECORDS IN EACH TABLE.
SELECT 'DEPARTMENT' AS TABLE_NAME, COUNT(*) AS RECORDS FROM DEPARTMENT
UNION ALL
SELECT 'AIRPORT', COUNT(*) FROM AIRPORT
UNION ALL
SELECT 'FLIGHT', COUNT(*) FROM FLIGHT
UNION ALL
SELECT 'FLIGHT_SCHEDULE', COUNT(*) FROM FLIGHT_SCHEDULE
UNION ALL
SELECT 'FLIGHT_ATTENDANT', COUNT(*) FROM FLIGHT_ATTENDANT
UNION ALL
SELECT 'ATTENDANT_ASSIGNMENT', COUNT(*) FROM ATTENDANT_ASSIGNMENT
UNION ALL
SELECT 'PASSENGER', COUNT(*) FROM PASSENGER
UNION ALL
SELECT 'BOOKING', COUNT(*) FROM BOOKING
UNION ALL
SELECT 'PAYMENT', COUNT(*) FROM PAYMENT
UNION ALL
SELECT 'ATTENDANT_CERTIFICATION', COUNT(*) FROM ATTENDANT_CERTIFICATION
UNION ALL
SELECT 'CREW_TRAINING', COUNT(*) FROM CREW_TRAINING
UNION ALL
SELECT 'FLIGHT_INCIDENT', COUNT(*) FROM FLIGHT_INCIDENT;

-- Q15. Display all records from the FLIGHT_ATTENDANT table.
select * from flight_attendant;

-- Q16. Display only the ATTENDANT_NAME, GENDER, and SALARY of all flight attendants.
select attendant_name,gender,salary  from flight_attendant;

-- Q17. Display the names of flight attendants whose salary is greater than 60,000.
select * from flight_attendant where salary >60000;

-- Q18. Display the flight attendants who belong to department 101.
select * from flight_attendant where department_id = 101;

-- Q19. Display the flight attendants whose salary is between 55,000 and 75,000.
select * from flight_attendant where salary between 55000 and 75000;

-- Q20. Display the flight attendants whose status is either ACTIVE or ON LEAVE.
select * from flight_attendant where status in ('active','on leave'); 



-- Q22. Display the names and salaries of all flight attendants in descending order of salary.
select attendant_name,salary from flight_attendant order by salary desc;

-- Q23. Display the names and salaries of flight attendants in ascending order of salary.
select attendant_name,salary from flight_attendant order by salary asc;

-- Q24. Display the top 3 highest-paid flight attendants.
select * from flight_attendant  order by salary desc limit 3;

-- Q25. Display the 3 lowest-paid flight attendants.
select * from flight_attendant order by salary asc limit 3;

-- Q26. Display the 5 most recently hired flight attendants.
select * from flight_attendant order by hire_date desc limit 5;

-- Q27. Display the 5 oldest flight attendants based on date of birth.
select * from flight_attendant order by date_of_birth asc limit 5;

-- Q28. Display the distinct statuses of flight attendants.
SELECT DISTINCT STATUS FROM FLIGHT_ATTENDANT;

-- Q29. Display the names of flight attendants whose name starts with the letter 'A'.
select attendant_name from flight_attendant where attendant_name like 'a%';

-- Q30. Display the names of flight attendants whose name ends with the letter 'a'.
select attendant_name from flight_attendant where attendant_name like '%a';

-- q33. display flight attendants whose salary is not equal to 60000.
select * from flight_attendant where salary <> 60000;

-- q34. display active flight attendants whose salary is greater than 60000.

select * from flight_attendant where status = 'active' and salary > 60000;

-- q35. display flight attendants whose salary is either 55000, 65000 or 85000.
select *from flight_attendant where salary in (55000, 65000, 85000);

-- q38. add an emergency contact column to the flight_attendant table.
alter table flight_attendant add emergency_contact varchar(15);

-- q39. rename the gate_number column to gate.
alter table flight_schedule rename column gate_number to gate;

-- q45. insert a new flight attendant into the flight_attendant table.
insert into flight_attendant
(attendant_id, attendant_name, gender, email, phone,
 date_of_birth, hire_date, salary, department_id, status)
values
(511, 'Neha Kulkarni', 'F', 'neha.kulkarni@gmail.com', '9876500011',
 '1998-05-12', '2024-01-15', 57000, 104, 'ACTIVE');
 
 -- q46. insert a new passenger into the passenger table.
insert into passenger
(passenger_id, first_name, last_name, gender, email, phone,
 city, date_of_birth, passport_number)
values
(711, 'Rahul', 'Desai', 'M', 'rahul.desai@gmail.com', '9876510011',
 'Mumbai', '1996-04-18', 'P10011');

-- q47. insert a new flight into the flight table.

insert into flight
(flight_id, flight_number, line_name, source_airport_id,
 destination_airport_id, aircraft_model, flight_type, duration_minutes)
values
(311, 'AI111', 'Air India', 201, 203, 'Airbus A320', 'DOMESTIC', 150);

-- q48. insert a new booking into the booking table.
insert into booking
(booking_id, passenger_id, flight_id, booking_date,
 journey_date, seat_number, fare, booking_status)
values
(811, 711, 311, '2026-09-20', '2026-09-25', '15A', 6500.00, 'CONFIRMED');

-- q49. insert a new payment for booking 811.
insert into payment
(payment_id, booking_id, payment_date, amount,
 payment_method, payment_status, transaction_reference)
values
(911, 811, '2026-09-20', 6500.00, 'UPI', 'SUCCESS', 'TXN10011');

-- q50. increase the salary of all flight attendants by 5%.
update flight_attendant set salary = salary * 1.05 where attendant_id > 0;

-- q51. change the status of attendant 511 to on leave.
update flight_attendant set status = 'ON LEAVE' where attendant_id = 511;

-- q52. increase the fare of booking 811 by 500.
update booking set fare = fare + 500 where booking_id = 811;

-- q53. change the status of booking 808 to confirmed.
update booking set booking_status = 'CONFIRMED' where booking_id = 808;

-- q54. change the status of payment 908 to success.
update payment set payment_status = 'SUCCESS' where payment_id = 908;

-- q55. delete the flight attendant with id 511.
delete from flight_attendant  where attendant_id = 511;

-- q56. delete the booking with id 811. -- booking_id = 811 is still being referenced by payment, so MySQL will not allow the parent booking to be deleted first.
delete from payment where payment_id = 911; -- To complete Q56 First delete the related payment:
delete from booking where booking_id = 811; -- Then delete the booking:

-- q57. find the total salary paid to all flight attendants.
select sum(salary) as total_salary from flight_attendant;

-- q58. find the average salary of all flight attendants.
select avg(salary) as average_salary from flight_attendant;

-- q59. find the highest salary among flight attendants.
select max(salary) as highest_salary from flight_attendant;

-- q60. find the lowest salary among flight attendants.
select min(salary) as lowest_salary from flight_attendant;

-- q61. count the total number of flight attendants.
select count(*) as total_attendants
from flight_attendant;

-- q62. count the number of flight attendants who have an email address.
select count(email) as attendants_with_email from flight_attendant;

-- Q63. FIND THE TOTAL REVENUE FROM CONFIRMED BOOKINGS.
SELECT SUM(FARE) AS TOTAL_REVENUE
FROM BOOKING
WHERE BOOKING_STATUS = 'CONFIRMED';

-- q64. find the average booking fare.
select avg(fare) as average_fare from booking;

-- q65. find the number of flight attendants in each department.
select department_id, count(*) as total_attendants from flight_attendant group by department_id;

-- q66. find the average salary of flight attendants in each department.
select department_id, avg(salary) as average_salary from flight_attendant group by department_id;

-- q67. find the highest salary in each department.
select department_id, max(salary) as highest_salary from flight_attendant group by department_id;

-- q68. find the lowest salary in each department.
select department_id, min(salary) as lowest_salary from flight_attendant group by department_id;

-- q69. find the total salary paid by each department.
select department_id, sum(salary) as total_salary from flight_attendant group by department_id;

-- q70. display departments having more than 2 flight attendants.
select department_id, count(*) as total_attendants
from flight_attendant group by department_id having count(*) > 2;

-- q71. display departments where the average salary is greater than 60000.
select department_id, avg(salary) as average_salary from flight_attendant
group by department_id having avg(salary) > 60000;

-- q72. display flight types having more than 2 flights.
select flight_type, count(*) as total_flights from flight group by flight_type having count(*) > 2;

-- q73. display each flight attendant's name along with their department name.
select fa.attendant_name, d.department_name from flight_attendant fa
inner join department d
on fa.department_id = d.department_id;

-- q74. display each flight number along with its source and destination airport names.
select f.flight_number, source_airport.airport_name as source_airport, destination_airport.airport_name as destination_airport from flight f
inner join airport source_airport
on f.source_airport_id = source_airport.airport_id
inner join airport destination_airport
on f.destination_airport_id = destination_airport.airport_id;

-- q75. display passenger names along with their booking fare.
select p.first_name, p.last_name, b.fare from passenger p
inner join booking b
on p.passenger_id = b.passenger_id;

-- q76. display flight attendants and the flights they are assigned to.
select fa.attendant_name, f.flight_number from flight_attendant fa
inner join attendant_assignment aa
on fa.attendant_id = aa.attendant_id
inner join flight f
on aa.flight_id = f.flight_id;

-- q77. display booking details along with the corresponding payment status.
 select b.booking_id, b.passenger_id, b.flight_id,b.fare, p.payment_status from booking b
inner join payment p
on b.booking_id = p.booking_id;

-- q78. display flight attendants whose salary is greater than the average salary.
select *from flight_attendant where salary > (select avg(salary)
from flight_attendant
);

-- q79. display the flight attendant(s) who have the highest salary.
select *from flight_attendant where salary = ( select max(salary)
from flight_attendant
);
-- q80. display passengers who have made at least one booking.
select *from passenger
where passenger_id in (
select passenger_id from booking
);

-- q81. display bookings whose fare is greater than the average booking fare.
select *from booking where fare > (select avg(fare)
from booking
);

-- q82. display flight attendants who earn more than all attendants in department 101.

select *from flight_attendant
where salary > all (select salary
from flight_attendant where department_id = 101
);

-- q84. display passengers who have no bookings.
select *from passenger p
where not exists (select 1 from booking b
where b.passenger_id = p.passenger_id
);

-- q85. display flight attendants who have been assigned to at least one flight.
select *from flight_attendant fa
where exists (select 1 from attendant_assignment aa
where aa.attendant_id = fa.attendant_id
);

-- q86. display flights that have at least one flight attendant assigned to them.

select *from flight f where exists (select 1 from attendant_assignment aa
where aa.flight_id = f.flight_id
);

-- q87. display flights that have no flight attendant assigned.
select *from flight f where not exists ( select 1 from attendant_assignment aa
where aa.flight_id = f.flight_id
);

-- q88. insert 90 additional records into the department table.
insert into department
(department_id, department_name, manager_name, location, budget)
values
(111, 'Cabin Services', 'Amit Sharma', 'Mumbai', 2500000.00),
(112, 'Crew Scheduling', 'Priya Mehta', 'Delhi', 2800000.00),
(113, 'Passenger Relations', 'Rahul Verma', 'Pune', 1900000.00),
(114, 'Aviation Security', 'Sneha Patil', 'Bangalore', 3200000.00),
(115, 'Flight Catering', 'Vikram Singh', 'Hyderabad', 2100000.00),
(116, 'Baggage Services', 'Neha Kapoor', 'Chennai', 1850000.00),
(117, 'Airport Coordination', 'Rohan Joshi', 'Kolkata', 2300000.00),
(118, 'Crew Welfare', 'Anjali Rao', 'Ahmedabad', 1700000.00),
(119, 'Emergency Services', 'Karan Shah', 'Goa', 2900000.00),
(120, 'Quality Control', 'Meera Nair', 'Kochi', 2400000.00),
(121, 'Cabin Safety', 'Arjun Malhotra', 'Mumbai', 3100000.00),
(122, 'Passenger Assistance', 'Riya Deshmukh', 'Delhi', 1750000.00),
(123, 'International Operations', 'Aditya Kulkarni', 'Pune', 3000000.00),
(124, 'Domestic Operations', 'Pooja Gupta', 'Jaipur', 2250000.00),
(125, 'Crew Planning', 'Sahil Jain', 'Mumbai', 2600000.00),
(126, 'Service Standards', 'Nisha Yadav', 'Lucknow', 1950000.00),
(127, 'Aviation Compliance', 'Manish Kumar', 'Delhi', 3350000.00),
(128, 'Crew Administration', 'Kavita Joshi', 'Nagpur', 1650000.00),
(129, 'Onboard Services', 'Deepak Rao', 'Bangalore', 2150000.00),
(130, 'Flight Coordination', 'Swati Shah', 'Ahmedabad', 2750000.00),
(131, 'Crew Development', 'Raj Malhotra', 'Mumbai', 2450000.00),
(132, 'Safety Training', 'Isha Mehta', 'Chennai', 3150000.00),
(133, 'Cabin Management', 'Varun Patel', 'Surat', 2350000.00),
(134, 'Service Training', 'Simran Kaur', 'Delhi', 2000000.00),
(135, 'Crew Support', 'Nitin Verma', 'Pune', 1800000.00),
(136, 'Aviation Training', 'Ayesha Khan', 'Hyderabad', 2950000.00),
(137, 'Passenger Support', 'Mohit Agarwal', 'Mumbai', 1650000.00),
(138, 'Flight Services', 'Tanvi Rao', 'Kolkata', 2250000.00),
(139, 'Crew Compliance', 'Abhishek Singh', 'Jaipur', 2850000.00),
(140, 'Cabin Standards', 'Madhuri Patil', 'Nashik', 2200000.00),
(141, 'Safety Compliance', 'Suresh Nair', 'Kochi', 3300000.00),
(142, 'Crew Logistics', 'Komal Shah', 'Mumbai', 2100000.00),
(143, 'Passenger Safety', 'Yash Desai', 'Pune', 3050000.00),
(144, 'Airline Services', 'Priyanka Joshi', 'Delhi', 2550000.00),
(145, 'Crew Recruitment', 'Akash Mehta', 'Bangalore', 2000000.00),
(146, 'Cabin Training', 'Shreya Kulkarni', 'Mumbai', 2900000.00),
(147, 'Flight Operations Support', 'Rakesh Sharma', 'Hyderabad', 3450000.00),
(148, 'Customer Experience', 'Ananya Gupta', 'Chennai', 2250000.00),
(149, 'Crew Performance', 'Harsh Patel', 'Ahmedabad', 2700000.00),
(150, 'Aviation Support', 'Divya Singh', 'Kolkata', 1900000.00),
(151, 'International Services', 'Aman Jain', 'Mumbai', 3150000.00),
(152, 'Domestic Services', 'Muskan Verma', 'Delhi', 2350000.00),
(153, 'Crew Relations', 'Ritesh Shah', 'Pune', 1800000.00),
(154, 'Safety Operations', 'Payal Mehta', 'Jaipur', 3300000.00),
(155, 'Cabin Coordination', 'Gaurav Rao', 'Bangalore', 2450000.00),
(156, 'Service Quality', 'Snehal Patil', 'Mumbai', 2200000.00),
(157, 'Flight Safety Training', 'Vivek Kumar', 'Lucknow', 3000000.00),
(158, 'Crew Scheduling Support', 'Reena Nair', 'Kochi', 1900000.00),
(159, 'Passenger Experience', 'Abhinav Singh', 'Delhi', 2300000.00),
(160, 'Aviation Operations', 'Monika Shah', 'Surat', 3100000.00),
(161, 'Cabin Crew Support', 'Sanjay Gupta', 'Mumbai', 2000000.00),
(162, 'Flight Administration', 'Radhika Joshi', 'Pune', 2150000.00),
(163, 'Crew Safety', 'Tarun Mehta', 'Hyderabad', 3200000.00),
(164, 'Passenger Assistance Services', 'Neelam Rao', 'Chennai', 1850000.00),
(165, 'Aviation Quality', 'Kunal Patil', 'Nashik', 2800000.00),
(166, 'Crew Operations', 'Shweta Sharma', 'Delhi', 2400000.00),
(167, 'Cabin Services Support', 'Rohit Desai', 'Mumbai', 2500000.00),
(168, 'Flight Coordination Support', 'Pallavi Shah', 'Ahmedabad', 2100000.00),
(169, 'Crew Training Support', 'Sameer Khan', 'Kolkata', 2700000.00),
(170, 'Passenger Services', 'Aarti Mehta', 'Pune', 1950000.00),
(171, 'Aviation Security Training', 'Rajesh Kumar', 'Delhi', 3450000.00),
(172, 'Crew Welfare Services', 'Shalini Gupta', 'Mumbai', 1700000.00),
(173, 'Cabin Operations Support', 'Imran Sheikh', 'Hyderabad', 2300000.00),
(174, 'Flight Service Management', 'Bhavna Rao', 'Chennai', 2600000.00),
(175, 'Crew Certification', 'Naveen Singh', 'Jaipur', 2900000.00),
(176, 'Passenger Relations Support', 'Kiran Joshi', 'Mumbai', 1800000.00),
(177, 'Aviation Compliance Support', 'Alok Mehta', 'Pune', 3100000.00),
(178, 'Cabin Quality', 'Ritu Patil', 'Bangalore', 2350000.00),
(179, 'Flight Operations Services', 'Chetan Shah', 'Delhi', 3200000.00),
(180, 'Crew Resource Management', 'Sonal Nair', 'Kochi', 2550000.00),
(181, 'Onboard Safety', 'Manoj Kumar', 'Mumbai', 3000000.00),
(182, 'Service Operations', 'Poonam Gupta', 'Nagpur', 2150000.00),
(183, 'Crew Planning Support', 'Ravi Desai', 'Pune', 2300000.00),
(184, 'Passenger Care', 'Nandini Rao', 'Delhi', 1900000.00),
(185, 'Flight Safety Support', 'Vishal Patil', 'Hyderabad', 3250000.00),
(186, 'Cabin Crew Development', 'Shikha Sharma', 'Mumbai', 2750000.00),
(187, 'Aviation Service Quality', 'Yogesh Singh', 'Chennai', 2450000.00),
(188, 'Crew Administration Support', 'Preeti Shah', 'Ahmedabad', 1800000.00),
(189, 'Passenger Assistance Support', 'Siddharth Jain', 'Kolkata', 2000000.00),
(190, 'Flight Coordination Services', 'Manisha Mehta', 'Pune', 2650000.00),
(191, 'Crew Operations Support', 'Ankit Rao', 'Mumbai', 2250000.00),
(192, 'Cabin Safety Support', 'Garima Joshi', 'Delhi', 3150000.00),
(193, 'Aviation Training Support', 'Lokesh Kumar', 'Bangalore', 2850000.00),
(194, 'Passenger Service Quality', 'Namrata Patil', 'Mumbai', 2100000.00),
(195, 'Crew Compliance Support', 'Saurabh Shah', 'Hyderabad', 2950000.00),
(196, 'Flight Services Support', 'Rupali Nair', 'Kochi', 2200000.00),
(197, 'Cabin Management Support', 'Vijay Singh', 'Jaipur', 2600000.00),
(198, 'Crew Safety Support', 'Mitali Gupta', 'Delhi', 3050000.00),
(199, 'Airline Operations Support', 'Pranav Mehta', 'Pune', 2800000.00),
(200, 'Aviation Crew Services', 'Sonali Rao', 'Mumbai', 2400000.00);

select count(*) as total_records
from department;

-- q89. insert 90 additional records into the airport table.

insert into airport
(airport_id, airport_code, airport_name, city, country, terminals, established_date)
values
(211, 'JAI', 'Jaipur International Airport', 'Jaipur', 'India', 2, '2005-12-29'),
(212, 'LKO', 'Chaudhary Charan Singh International Airport', 'Lucknow', 'India', 2, '1986-05-01'),
(213, 'NAG', 'Dr. Babasaheb Ambedkar International Airport', 'Nagpur', 'India', 1, '1917-04-01'),
(214, 'SXR', 'Sheikh ul Alam International Airport', 'Srinagar', 'India', 1, '1948-01-01'),
(215, 'PAT', 'Jay Prakash Narayan International Airport', 'Patna', 'India', 2, '1973-01-01'),
(216, 'IXC', 'Chandigarh International Airport', 'Chandigarh', 'India', 2, '2015-09-11'),
(217, 'GAU', 'Lokpriya Gopinath Bordoloi International Airport', 'Guwahati', 'India', 1, '1958-01-01'),
(218, 'BHU', 'Bhuj Airport', 'Bhuj', 'India', 1, '1950-01-01'),
(219, 'VNS', 'Lal Bahadur Shastri International Airport', 'Varanasi', 'India', 1, '2005-10-01'),
(220, 'IXM', 'Madurai Airport', 'Madurai', 'India', 1, '1957-01-01'),
(221, 'CJB', 'Coimbatore International Airport', 'Coimbatore', 'India', 1, '1940-01-01'),
(222, 'TRV', 'Thiruvananthapuram International Airport', 'Thiruvananthapuram', 'India', 2, '1932-01-01'),
(223, 'CCJ', 'Calicut International Airport', 'Kozhikode', 'India', 1, '1988-04-13'),
(224, 'IXE', 'Mangalore International Airport', 'Mangalore', 'India', 1, '1951-01-01'),
(225, 'PNY', 'Puducherry Airport', 'Puducherry', 'India', 1, '1989-01-01'),
(226, 'VTZ', 'Visakhapatnam International Airport', 'Visakhapatnam', 'India', 2, '1981-01-01'),
(227, 'RPR', 'Swami Vivekananda Airport', 'Raipur', 'India', 1, '2012-01-01'),
(228, 'BHO', 'Raja Bhoj Airport', 'Bhopal', 'India', 1, '2010-01-01'),
(229, 'IDR', 'Devi Ahilyabai Holkar Airport', 'Indore', 'India', 2, '1948-01-01'),
(230, 'JDH', 'Jodhpur Airport', 'Jodhpur', 'India', 1, '1927-01-01'),
(231, 'UDQ', 'Maharana Pratap Airport', 'Udaipur', 'India', 1, '1954-01-01'),
(232, 'DIB', 'Dibrugarh Airport', 'Dibrugarh', 'India', 1, '1950-01-01'),
(233, 'IXA', 'Maharaja Bir Bikram Airport', 'Agartala', 'India', 1, '1942-01-01'),
(234, 'IMF', 'Bir Tikendrajit International Airport', 'Imphal', 'India', 1, '1940-01-01'),
(235, 'IXR', 'Birsa Munda Airport', 'Ranchi', 'India', 2, '1940-01-01'),
(236, 'BBI', 'Biju Patnaik International Airport', 'Bhubaneswar', 'India', 2, '1962-01-01'),
(237, 'TIR', 'Tirupati Airport', 'Tirupati', 'India', 1, '1970-01-01'),
(238, 'VGA', 'Vijayawada International Airport', 'Vijayawada', 'India', 1, '1984-01-01'),
(239, 'STV', 'Surat Airport', 'Surat', 'India', 1, '1970-01-01'),
(240, 'RAJ', 'Rajkot Airport', 'Rajkot', 'India', 1, '1950-01-01'),
(241, 'BDQ', 'Vadodara Airport', 'Vadodara', 'India', 1, '1929-01-01'),
(242, 'IXJ', 'Jammu Airport', 'Jammu', 'India', 1, '1985-01-01'),
(243, 'DED', 'Jolly Grant Airport', 'Dehradun', 'India', 1, '2008-03-30'),
(244, 'DHM', 'Kangra Airport', 'Dharamshala', 'India', 1, '1962-01-01'),
(245, 'KUU', 'Bhuntar Airport', 'Kullu', 'India', 1, '1972-01-01'),
(246, 'SLV', 'Shimla Airport', 'Shimla', 'India', 1, '2008-09-01'),
(247, 'IXZ', 'Veer Savarkar International Airport', 'Port Blair', 'India', 1, '1956-01-01'),
(248, 'IXB', 'Bagdogra Airport', 'Siliguri', 'India', 1, '1962-01-01'),
(249, 'GAY', 'Gaya Airport', 'Gaya', 'India', 1, '1948-01-01'),
(250, 'JLR', 'Jabalpur Airport', 'Jabalpur', 'India', 1, '1930-01-01'),
(251, 'IXY', 'Kandla Airport', 'Kandla', 'India', 1, '1952-01-01'),
(252, 'BHJ', 'Bhavnagar Airport', 'Bhavnagar', 'India', 1, '1932-01-01'),
(253, 'AKD', 'Akola Airport', 'Akola', 'India', 1, '1950-01-01'),
(254, 'NSK', 'Nashik Airport', 'Nashik', 'India', 1, '1964-01-01'),
(255, 'MYQ', 'Mysore Airport', 'Mysore', 'India', 1, '1948-01-01'),
(256, 'HJR', 'Khajuraho Airport', 'Khajuraho', 'India', 1, '1978-01-01'),
(257, 'TCR', 'Tuticorin Airport', 'Thoothukudi', 'India', 1, '1992-01-01'),
(258, 'TRZ', 'Tiruchirappalli International Airport', 'Tiruchirappalli', 'India', 1, '1942-01-01'),
(259, 'KNQ', 'Kanpur Airport', 'Kanpur', 'India', 1, '1940-01-01'),
(260, 'AGR', 'Agra Airport', 'Agra', 'India', 1, '1942-01-01'),
(261, 'GWL', 'Rajmata Vijaya Raje Scindia Airport', 'Gwalior', 'India', 1, '1910-01-01'),
(262, 'BKB', 'Nal Airport', 'Bikaner', 'India', 1, '1960-01-01'),
(263, 'JGA', 'Jamnagar Airport', 'Jamnagar', 'India', 1, '1929-01-01'),
(264, 'IXU', 'Aurangabad Airport', 'Aurangabad', 'India', 1, '1976-01-01'),
(265, 'DIU', 'Diu Airport', 'Diu', 'India', 1, '1954-01-01'),
(266, 'PNR', 'Purnea Airport', 'Purnea', 'India', 1, '2024-01-01'),
(267, 'DBR', 'Darbhanga Airport', 'Darbhanga', 'India', 1, '2020-11-08'),
(268, 'RJA', 'Rajahmundry Airport', 'Rajahmundry', 'India', 1, '1980-01-01'),
(269, 'KQH', 'Kishangarh Airport', 'Kishangarh', 'India', 1, '2017-10-11'),
(270, 'JRH', 'Jorhat Airport', 'Jorhat', 'India', 1, '1950-01-01'),
(271, 'IXS', 'Silchar Airport', 'Silchar', 'India', 1, '1960-01-01'),
(272, 'DMU', 'Dimapur Airport', 'Dimapur', 'India', 1, '1960-01-01'),
(273, 'AJL', 'Lengpui Airport', 'Aizawl', 'India', 1, '1998-02-01'),
(274, 'SHL', 'Shillong Airport', 'Shillong', 'India', 1, '1962-01-01'),
(275, 'TEZ', 'Tezpur Airport', 'Tezpur', 'India', 1, '1950-01-01'),
(276, 'DEP', 'Daporijo Airport', 'Daporijo', 'India', 1, '1960-01-01'),
(277, 'ZER', 'Zero Airport', 'Zero', 'India', 1, '1960-01-01'),
(278, 'PBD', 'Porbandar Airport', 'Porbandar', 'India', 1, '1950-01-01'),
(279, 'SAG', 'Shirdi Airport', 'Shirdi', 'India', 1, '2017-10-01'),
(280, 'NSQ', 'Nashik Regional Airport', 'Nashik', 'India', 1, '1964-01-01'),
(281, 'GOP', 'Gorakhpur Airport', 'Gorakhpur', 'India', 1, '1960-01-01'),
(282, 'KNR', 'Kanpur Civil Airport', 'Kanpur', 'India', 1, '1940-01-01'),
(283, 'REW', 'Rewa Airport', 'Rewa', 'India', 1, '2024-01-01'),
(284, 'UDW', 'Udaipur Regional Airport', 'Udaipur', 'India', 1, '1954-01-01'),
(285, 'JSA', 'Jaisalmer Airport', 'Jaisalmer', 'India', 1, '2013-01-01'),
(286, 'IXT', 'Pasighat Airport', 'Pasighat', 'India', 1, '1962-01-01'),
(287, 'DGH', 'Deoghar Airport', 'Deoghar', 'India', 1, '2022-07-12'),
(288, 'RDP', 'Kazi Nazrul Islam Airport', 'Durgapur', 'India', 1, '2013-01-01'),
(289, 'COH', 'Cooch Behar Airport', 'Cooch Behar', 'India', 1, '1950-01-01'),
(290, 'BUP', 'Bathinda Airport', 'Bathinda', 'India', 1, '1980-01-01'),
(291, 'VSB', 'Bhavnagar Regional Airport', 'Bhavnagar', 'India', 1, '1932-01-01'),
(292, 'HSS', 'Hisar Airport', 'Hisar', 'India', 1, '1965-01-01'),
(293, 'KCR', 'Kochi Regional Airport', 'Kochi', 'India', 1, '1999-01-01'),
(294, 'MZU', 'Muzaffarpur Airport', 'Muzaffarpur', 'India', 1, '1960-01-01'),
(295, 'NDC', 'Nanded Airport', 'Nanded', 'India', 1, '1950-01-01'),
(296, 'VLM', 'Valmiki Nagar Airport', 'Valmiki Nagar', 'India', 1, '2024-01-01'),
(297, 'SIB', 'Sibi Airport', 'Sibi', 'India', 1, '2024-01-01'),
(298, 'DHL', 'Dholera International Airport', 'Dholera', 'India', 1, '2024-01-01'),
(299, 'KDP', 'Kadapa Airport', 'Kadapa', 'India', 1, '2015-06-01'),
(300, 'CNN', 'Kannur International Airport', 'Kannur', 'India', 1, '2018-12-09');

select count(*) as total_records
from airport;

show create table flight;


-- q90. insert 90 additional records into the flight table.
insert into flight
(flight_id, flight_number, line_name, source_airport_id, destination_airport_id, aircraft_model, flight_type, duration_minutes)
values
(11, 'AI201', 'Air India', 201, 211, 'Airbus A320', 'DOMESTIC', 135),
(12, 'AI202', 'Air India', 211, 202, 'Boeing 737', 'DOMESTIC', 140),
(13, '6E301', 'IndiGo', 202, 212, 'Airbus A320neo', 'DOMESTIC', 125),
(14, '6E302', 'IndiGo', 212, 203, 'Airbus A321', 'DOMESTIC', 130),
(15, 'UK401', 'Vistara', 203, 213, 'Airbus A320', 'DOMESTIC', 145),
(16, 'UK402', 'Vistara', 213, 204, 'Boeing 737', 'DOMESTIC', 150),
(17, 'SG501', 'SpiceJet', 204, 214, 'Boeing 737 MAX', 'DOMESTIC', 155),
(18, 'SG502', 'SpiceJet', 214, 205, 'Boeing 737', 'DOMESTIC', 160),
(19, 'AI203', 'Air India', 205, 215, 'Airbus A321', 'DOMESTIC', 145),
(20, 'AI204', 'Air India', 215, 206, 'Airbus A320', 'DOMESTIC', 150),
(21, '6E303', 'IndiGo', 206, 216, 'Airbus A320neo', 'DOMESTIC', 120),
(22, '6E304', 'IndiGo', 216, 207, 'Airbus A321', 'DOMESTIC', 125),
(23, 'UK403', 'Vistara', 207, 217, 'Airbus A320', 'DOMESTIC', 135),
(24, 'UK404', 'Vistara', 217, 208, 'Boeing 737', 'DOMESTIC', 140),
(25, 'SG503', 'SpiceJet', 208, 218, 'Boeing 737 MAX', 'DOMESTIC', 150),
(26, 'SG504', 'SpiceJet', 218, 209, 'Boeing 737', 'DOMESTIC', 155),
(27, 'AI205', 'Air India', 209, 219, 'Airbus A320', 'DOMESTIC', 135),
(28, 'AI206', 'Air India', 219, 210, 'Airbus A321', 'DOMESTIC', 145),
(29, '6E305', 'IndiGo', 210, 220, 'Airbus A320neo', 'DOMESTIC', 130),
(30, '6E306', 'IndiGo', 220, 211, 'Airbus A320', 'DOMESTIC', 135),
(31, 'UK405', 'Vistara', 211, 221, 'Airbus A321', 'DOMESTIC', 145),
(32, 'UK406', 'Vistara', 221, 212, 'Airbus A320', 'DOMESTIC', 150),
(33, 'SG505', 'SpiceJet', 212, 222, 'Boeing 737', 'DOMESTIC', 155),
(34, 'SG506', 'SpiceJet', 222, 213, 'Boeing 737 MAX', 'DOMESTIC', 160),
(35, 'AI207', 'Air India', 213, 223, 'Airbus A320', 'DOMESTIC', 140),
(36, 'AI208', 'Air India', 223, 214, 'Airbus A321', 'DOMESTIC', 145),
(37, '6E307', 'IndiGo', 214, 224, 'Airbus A320neo', 'DOMESTIC', 135),
(38, '6E308', 'IndiGo', 224, 215, 'Airbus A320', 'DOMESTIC', 140),
(39, 'UK407', 'Vistara', 215, 225, 'Airbus A321', 'DOMESTIC', 150),
(40, 'UK408', 'Vistara', 225, 216, 'Airbus A320', 'DOMESTIC', 155),
(41, 'SG507', 'SpiceJet', 216, 226, 'Boeing 737', 'DOMESTIC', 160),
(42, 'SG508', 'SpiceJet', 226, 217, 'Boeing 737 MAX', 'DOMESTIC', 165),
(43, 'AI209', 'Air India', 217, 227, 'Airbus A320', 'DOMESTIC', 135),
(44, 'AI210', 'Air India', 227, 218, 'Airbus A321', 'DOMESTIC', 145),
(45, '6E309', 'IndiGo', 218, 228, 'Airbus A320neo', 'DOMESTIC', 130),
(46, '6E310', 'IndiGo', 228, 219, 'Airbus A320', 'DOMESTIC', 140),
(47, 'UK409', 'Vistara', 219, 229, 'Airbus A321', 'DOMESTIC', 150),
(48, 'UK410', 'Vistara', 229, 220, 'Airbus A320', 'DOMESTIC', 155),
(49, 'SG509', 'SpiceJet', 220, 230, 'Boeing 737', 'DOMESTIC', 160),
(50, 'SG510', 'SpiceJet', 230, 221, 'Boeing 737 MAX', 'DOMESTIC', 165),
(51, 'AI211', 'Air India', 221, 231, 'Airbus A320', 'DOMESTIC', 135),
(52, 'AI212', 'Air India', 231, 222, 'Airbus A321', 'DOMESTIC', 145),
(53, '6E311', 'IndiGo', 222, 232, 'Airbus A320neo', 'DOMESTIC', 130),
(54, '6E312', 'IndiGo', 232, 223, 'Airbus A320', 'DOMESTIC', 140),
(55, 'UK411', 'Vistara', 223, 233, 'Airbus A321', 'DOMESTIC', 150),
(56, 'UK412', 'Vistara', 233, 224, 'Airbus A320', 'DOMESTIC', 155),
(57, 'SG511', 'SpiceJet', 224, 234, 'Boeing 737', 'DOMESTIC', 160),
(58, 'SG512', 'SpiceJet', 234, 225, 'Boeing 737 MAX', 'DOMESTIC', 165),
(59, 'AI213', 'Air India', 225, 235, 'Airbus A320', 'DOMESTIC', 135),
(60, 'AI214', 'Air India', 235, 226, 'Airbus A321', 'DOMESTIC', 145),
(61, '6E313', 'IndiGo', 226, 236, 'Airbus A320neo', 'DOMESTIC', 130),
(62, '6E314', 'IndiGo', 236, 227, 'Airbus A320', 'DOMESTIC', 140),
(63, 'UK413', 'Vistara', 227, 237, 'Airbus A321', 'DOMESTIC', 150),
(64, 'UK414', 'Vistara', 237, 228, 'Airbus A320', 'DOMESTIC', 155),
(65, 'SG513', 'SpiceJet', 228, 238, 'Boeing 737', 'DOMESTIC', 160),
(66, 'SG514', 'SpiceJet', 238, 229, 'Boeing 737 MAX', 'DOMESTIC', 165),
(67, 'AI215', 'Air India', 229, 239, 'Airbus A320', 'DOMESTIC', 135),
(68, 'AI216', 'Air India', 239, 230, 'Airbus A321', 'DOMESTIC', 145),
(69, '6E315', 'IndiGo', 230, 240, 'Airbus A320neo', 'DOMESTIC', 130),
(70, '6E316', 'IndiGo', 240, 231, 'Airbus A320', 'DOMESTIC', 140),
(71, 'UK415', 'Vistara', 231, 241, 'Airbus A321', 'DOMESTIC', 150),
(72, 'UK416', 'Vistara', 241, 232, 'Airbus A320', 'DOMESTIC', 155),
(73, 'SG515', 'SpiceJet', 232, 242, 'Boeing 737', 'DOMESTIC', 160),
(74, 'SG516', 'SpiceJet', 242, 233, 'Boeing 737 MAX', 'DOMESTIC', 165),
(75, 'AI217', 'Air India', 233, 243, 'Airbus A320', 'DOMESTIC', 135),
(76, 'AI218', 'Air India', 243, 234, 'Airbus A321', 'DOMESTIC', 145),
(77, '6E317', 'IndiGo', 234, 244, 'Airbus A320neo', 'DOMESTIC', 130),
(78, '6E318', 'IndiGo', 244, 235, 'Airbus A320', 'DOMESTIC', 140),
(79, 'UK417', 'Vistara', 235, 245, 'Airbus A321', 'DOMESTIC', 150),
(80, 'UK418', 'Vistara', 245, 236, 'Airbus A320', 'DOMESTIC', 155),
(81, 'SG517', 'SpiceJet', 236, 246, 'Boeing 737', 'DOMESTIC', 160),
(82, 'SG518', 'SpiceJet', 246, 237, 'Boeing 737 MAX', 'DOMESTIC', 165),
(83, 'AI219', 'Air India', 237, 247, 'Airbus A320', 'DOMESTIC', 135),
(84, 'AI220', 'Air India', 247, 238, 'Airbus A321', 'DOMESTIC', 145),
(85, '6E319', 'IndiGo', 238, 248, 'Airbus A320neo', 'DOMESTIC', 130),
(86, '6E320', 'IndiGo', 248, 239, 'Airbus A320', 'DOMESTIC', 140),
(87, 'UK419', 'Vistara', 239, 249, 'Airbus A321', 'DOMESTIC', 150),
(88, 'UK420', 'Vistara', 249, 240, 'Airbus A320', 'DOMESTIC', 155),
(89, 'SG519', 'SpiceJet', 240, 250, 'Boeing 737', 'DOMESTIC', 160),
(90, 'SG520', 'SpiceJet', 250, 241, 'Boeing 737 MAX', 'DOMESTIC', 165),
(91, 'AI221', 'Air India', 241, 251, 'Airbus A320', 'DOMESTIC', 135),
(92, 'AI222', 'Air India', 251, 242, 'Airbus A321', 'DOMESTIC', 145),
(93, '6E321', 'IndiGo', 242, 252, 'Airbus A320neo', 'DOMESTIC', 130),
(94, '6E322', 'IndiGo', 252, 243, 'Airbus A320', 'DOMESTIC', 140),
(95, 'UK421', 'Vistara', 243, 253, 'Airbus A321', 'DOMESTIC', 150),
(96, 'UK422', 'Vistara', 253, 244, 'Airbus A320', 'DOMESTIC', 155),
(97, 'SG521', 'SpiceJet', 244, 254, 'Boeing 737', 'DOMESTIC', 160),
(98, 'SG522', 'SpiceJet', 254, 245, 'Boeing 737 MAX', 'DOMESTIC', 165),
(99, 'AI223', 'Air India', 245, 255, 'Airbus A320', 'DOMESTIC', 135),
(100, 'AI224', 'Air India', 255, 246, 'Airbus A321', 'DOMESTIC', 145);

select count(*) as total_records
from flight;

SELECT COUNT(*) AS total_records
FROM FLIGHT_ATTENDANT;
show create table flight_schedule;

-- q91. insert 90 additional records into the flight_schedule table.
insert into flight_schedule
(schedule_id, flight_id, departure_time, arrival_time, gate, status, available_seats)
values
(11, 11, '2026-10-01 06:00:00', '2026-10-01 08:15:00', 'A01', 'SCHEDULED', 145),
(12, 12, '2026-10-01 07:00:00', '2026-10-01 09:20:00', 'A02', 'SCHEDULED', 130),
(13, 13, '2026-10-01 08:00:00', '2026-10-01 10:05:00', 'A03', 'SCHEDULED', 155),
(14, 14, '2026-10-01 09:00:00', '2026-10-01 11:10:00', 'A04', 'SCHEDULED', 140),
(15, 15, '2026-10-01 10:00:00', '2026-10-01 12:25:00', 'A05', 'SCHEDULED', 125),
(16, 16, '2026-10-01 11:00:00', '2026-10-01 13:30:00', 'A06', 'SCHEDULED', 135),
(17, 17, '2026-10-01 12:00:00', '2026-10-01 14:35:00', 'A07', 'SCHEDULED', 120),
(18, 18, '2026-10-01 13:00:00', '2026-10-01 15:40:00', 'A08', 'SCHEDULED', 110),
(19, 19, '2026-10-01 14:00:00', '2026-10-01 16:25:00', 'A09', 'SCHEDULED', 150),
(20, 20, '2026-10-01 15:00:00', '2026-10-01 17:30:00', 'A10', 'SCHEDULED', 140),
(21, 21, '2026-10-02 06:00:00', '2026-10-02 08:00:00', 'B01', 'SCHEDULED', 145),
(22, 22, '2026-10-02 07:00:00', '2026-10-02 09:05:00', 'B02', 'SCHEDULED', 130),
(23, 23, '2026-10-02 08:00:00', '2026-10-02 10:15:00', 'B03', 'SCHEDULED', 150),
(24, 24, '2026-10-02 09:00:00', '2026-10-02 11:20:00', 'B04', 'SCHEDULED', 135),
(25, 25, '2026-10-02 10:00:00', '2026-10-02 12:30:00', 'B05', 'SCHEDULED', 125),
(26, 26, '2026-10-02 11:00:00', '2026-10-02 13:35:00', 'B06', 'SCHEDULED', 140),
(27, 27, '2026-10-02 12:00:00', '2026-10-02 14:15:00', 'B07', 'SCHEDULED', 115),
(28, 28, '2026-10-02 13:00:00', '2026-10-02 15:25:00', 'B08', 'SCHEDULED', 130),
(29, 29, '2026-10-02 14:00:00', '2026-10-02 16:10:00', 'B09', 'SCHEDULED', 145),
(30, 30, '2026-10-02 15:00:00', '2026-10-02 17:15:00', 'B10', 'SCHEDULED', 120),
(31, 31, '2026-10-03 06:00:00', '2026-10-03 08:25:00', 'C01', 'SCHEDULED', 135),
(32, 32, '2026-10-03 07:00:00', '2026-10-03 09:30:00', 'C02', 'SCHEDULED', 140),
(33, 33, '2026-10-03 08:00:00', '2026-10-03 10:35:00', 'C03', 'SCHEDULED', 125),
(34, 34, '2026-10-03 09:00:00', '2026-10-03 11:40:00', 'C04', 'SCHEDULED', 130),
(35, 35, '2026-10-03 10:00:00', '2026-10-03 12:20:00', 'C05', 'SCHEDULED', 150),
(36, 36, '2026-10-03 11:00:00', '2026-10-03 13:25:00', 'C06', 'SCHEDULED', 135),
(37, 37, '2026-10-03 12:00:00', '2026-10-03 14:15:00', 'C07', 'SCHEDULED', 120),
(38, 38, '2026-10-03 13:00:00', '2026-10-03 15:20:00', 'C08', 'SCHEDULED', 140),
(39, 39, '2026-10-03 14:00:00', '2026-10-03 16:30:00', 'C09', 'SCHEDULED', 130),
(40, 40, '2026-10-03 15:00:00', '2026-10-03 17:35:00', 'C10', 'SCHEDULED', 145),
(41, 41, '2026-10-04 06:00:00', '2026-10-04 08:40:00', 'D01', 'SCHEDULED', 125),
(42, 42, '2026-10-04 07:00:00', '2026-10-04 09:45:00', 'D02', 'SCHEDULED', 135),
(43, 43, '2026-10-04 08:00:00', '2026-10-04 10:15:00', 'D03', 'SCHEDULED', 145),
(44, 44, '2026-10-04 09:00:00', '2026-10-04 11:25:00', 'D04', 'SCHEDULED', 130),
(45, 45, '2026-10-04 10:00:00', '2026-10-04 12:10:00', 'D05', 'SCHEDULED', 150),
(46, 46, '2026-10-04 11:00:00', '2026-10-04 13:20:00', 'D06', 'SCHEDULED', 140),
(47, 47, '2026-10-04 12:00:00', '2026-10-04 14:30:00', 'D07', 'SCHEDULED', 120),
(48, 48, '2026-10-04 13:00:00', '2026-10-04 15:35:00', 'D08', 'SCHEDULED', 135),
(49, 49, '2026-10-04 14:00:00', '2026-10-04 16:40:00', 'D09', 'SCHEDULED', 125),
(50, 50, '2026-10-04 15:00:00', '2026-10-04 17:45:00', 'D10', 'SCHEDULED', 145),
(51, 51, '2026-10-05 06:00:00', '2026-10-05 08:15:00', 'E01', 'SCHEDULED', 130),
(52, 52, '2026-10-05 07:00:00', '2026-10-05 09:25:00', 'E02', 'SCHEDULED', 140),
(53, 53, '2026-10-05 08:00:00', '2026-10-05 10:10:00', 'E03', 'SCHEDULED', 150),
(54, 54, '2026-10-05 09:00:00', '2026-10-05 11:20:00', 'E04', 'SCHEDULED', 125),
(55, 55, '2026-10-05 10:00:00', '2026-10-05 12:30:00', 'E05', 'SCHEDULED', 135),
(56, 56, '2026-10-05 11:00:00', '2026-10-05 13:35:00', 'E06', 'SCHEDULED', 145),
(57, 57, '2026-10-05 12:00:00', '2026-10-05 14:40:00', 'E07', 'SCHEDULED', 120),
(58, 58, '2026-10-05 13:00:00', '2026-10-05 15:45:00', 'E08', 'SCHEDULED', 130),
(59, 59, '2026-10-05 14:00:00', '2026-10-05 16:20:00', 'E09', 'SCHEDULED', 140),
(60, 60, '2026-10-05 15:00:00', '2026-10-05 17:25:00', 'E10', 'SCHEDULED', 150),
(61, 61, '2026-10-06 06:00:00', '2026-10-06 08:15:00', 'F01', 'SCHEDULED', 135),
(62, 62, '2026-10-06 07:00:00', '2026-10-06 09:20:00', 'F02', 'SCHEDULED', 125),
(63, 63, '2026-10-06 08:00:00', '2026-10-06 10:30:00', 'F03', 'SCHEDULED', 145),
(64, 64, '2026-10-06 09:00:00', '2026-10-06 11:35:00', 'F04', 'SCHEDULED', 130),
(65, 65, '2026-10-06 10:00:00', '2026-10-06 12:30:00', 'F05', 'SCHEDULED', 140),
(66, 66, '2026-10-06 11:00:00', '2026-10-06 13:45:00', 'F06', 'SCHEDULED', 120),
(67, 67, '2026-10-06 12:00:00', '2026-10-06 14:15:00', 'F07', 'SCHEDULED', 150),
(68, 68, '2026-10-06 13:00:00', '2026-10-06 15:25:00', 'F08', 'SCHEDULED', 135),
(69, 69, '2026-10-06 14:00:00', '2026-10-06 16:30:00', 'F09', 'SCHEDULED', 125),
(70, 70, '2026-10-06 15:00:00', '2026-10-06 17:20:00', 'F10', 'SCHEDULED', 145),
(71, 71, '2026-10-07 06:00:00', '2026-10-07 08:30:00', 'G01', 'SCHEDULED', 130),
(72, 72, '2026-10-07 07:00:00', '2026-10-07 09:35:00', 'G02', 'SCHEDULED', 140),
(73, 73, '2026-10-07 08:00:00', '2026-10-07 10:40:00', 'G03', 'SCHEDULED', 120),
(74, 74, '2026-10-07 09:00:00', '2026-10-07 11:45:00', 'G04', 'SCHEDULED', 135),
(75, 75, '2026-10-07 10:00:00', '2026-10-07 12:15:00', 'G05', 'SCHEDULED', 145),
(76, 76, '2026-10-07 11:00:00', '2026-10-07 13:25:00', 'G06', 'SCHEDULED', 130),
(77, 77, '2026-10-07 12:00:00', '2026-10-07 14:10:00', 'G07', 'SCHEDULED', 150),
(78, 78, '2026-10-07 13:00:00', '2026-10-07 15:20:00', 'G08', 'SCHEDULED', 125),
(79, 79, '2026-10-07 14:00:00', '2026-10-07 16:30:00', 'G09', 'SCHEDULED', 140),
(80, 80, '2026-10-07 15:00:00', '2026-10-07 17:35:00', 'G10', 'SCHEDULED', 135),
(81, 81, '2026-10-08 06:00:00', '2026-10-08 08:40:00', 'H01', 'SCHEDULED', 125),
(82, 82, '2026-10-08 07:00:00', '2026-10-08 09:45:00', 'H02', 'SCHEDULED', 140),
(83, 83, '2026-10-08 08:00:00', '2026-10-08 10:15:00', 'H03', 'SCHEDULED', 130),
(84, 84, '2026-10-08 09:00:00', '2026-10-08 11:25:00', 'H04', 'SCHEDULED', 145),
(85, 85, '2026-10-08 10:00:00', '2026-10-08 12:10:00', 'H05', 'SCHEDULED', 150),
(86, 86, '2026-10-08 11:00:00', '2026-10-08 13:20:00', 'H06', 'SCHEDULED', 135),
(87, 87, '2026-10-08 12:00:00', '2026-10-08 14:30:00', 'H07', 'SCHEDULED', 120),
(88, 88, '2026-10-08 13:00:00', '2026-10-08 15:35:00', 'H08', 'SCHEDULED', 140),
(89, 89, '2026-10-08 14:00:00', '2026-10-08 16:40:00', 'H09', 'SCHEDULED', 125),
(90, 90, '2026-10-08 15:00:00', '2026-10-08 17:45:00', 'H10', 'SCHEDULED', 145),
(91, 91, '2026-10-09 06:00:00', '2026-10-09 08:25:00', 'I01', 'SCHEDULED', 130),
(92, 92, '2026-10-09 07:00:00', '2026-10-09 09:30:00', 'I02', 'SCHEDULED', 140),
(93, 93, '2026-10-09 08:00:00', '2026-10-09 10:10:00', 'I03', 'SCHEDULED', 125),
(94, 94, '2026-10-09 09:00:00', '2026-10-09 11:20:00', 'I04', 'SCHEDULED', 135),
(95, 95, '2026-10-09 10:00:00', '2026-10-09 12:30:00', 'I05', 'SCHEDULED', 145),
(96, 96, '2026-10-09 11:00:00', '2026-10-09 13:35:00', 'I06', 'SCHEDULED', 130),
(97, 97, '2026-10-09 12:00:00', '2026-10-09 14:40:00', 'I07', 'SCHEDULED', 150),
(98, 98, '2026-10-09 13:00:00', '2026-10-09 15:45:00', 'I08', 'SCHEDULED', 125),
(99, 99, '2026-10-09 14:00:00', '2026-10-09 16:20:00', 'I09', 'SCHEDULED', 140),
(100, 100, '2026-10-09 15:00:00', '2026-10-09 17:25:00', 'I10', 'SCHEDULED', 135);

SELECT SCHEDULE_ID, DEPARTURE_TIME, ARRIVAL_TIME
FROM FLIGHT_SCHEDULE
WHERE ARRIVAL_TIME <= DEPARTURE_TIME;

select count(*) as total_records
from flight_schedule;

show create table flight_attendant;
-- q92. insert 90 additional records into the flight_attendant table.
insert into flight_attendant
(attendant_id, attendant_name, gender, email, phone, date_of_birth, hire_date, salary, department_id, status, emergency_contact)
values
(11, 'Aarav Sharma', 'M', 'aarav11@gmail.com', '9000000011', '1995-01-15', '2021-06-10', 45000.00, 101, 'ACTIVE', '9100000011'),
(12, 'Ananya Patil', 'F', 'ananya12@gmail.com', '9000000012', '1997-03-22', '2022-02-15', 47000.00, 102, 'ACTIVE', '9100000012'),
(13, 'Rohan Mehta', 'M', 'rohan13@gmail.com', '9000000013', '1994-05-10', '2020-08-20', 52000.00, 103, 'ACTIVE', '9100000013'),
(14, 'Priya Shah', 'F', 'priya14@gmail.com', '9000000014', '1996-07-18', '2021-11-05', 48000.00, 104, 'ON LEAVE', '9100000014'),
(15, 'Karan Joshi', 'M', 'karan15@gmail.com', '9000000015', '1993-09-12', '2019-04-12', 56000.00, 105, 'ACTIVE', '9100000015'),
(16, 'Sneha Rao', 'F', 'sneha16@gmail.com', '9000000016', '1998-02-25', '2023-01-10', 43000.00, 106, 'ACTIVE', '9100000016'),
(17, 'Vikram Singh', 'M', 'vikram17@gmail.com', '9000000017', '1992-11-08', '2018-07-15', 61000.00, 107, 'ACTIVE', '9100000017'),
(18, 'Neha Kapoor', 'F', 'neha18@gmail.com', '9000000018', '1997-04-14', '2022-09-01', 46000.00, 108, 'ACTIVE', '9100000018'),
(19, 'Aditya Verma', 'M', 'aditya19@gmail.com', '9000000019', '1995-06-30', '2020-12-18', 51000.00, 109, 'ACTIVE', '9100000019'),
(20, 'Pooja Gupta', 'F', 'pooja20@gmail.com', '9000000020', '1996-10-21', '2021-03-25', 49000.00, 110, 'ON LEAVE', '9100000020'),

(21, 'Rahul Nair', 'M', 'rahul21@gmail.com', '9000000021', '1994-01-11', '2019-09-10', 55000.00, 101, 'ACTIVE', '9100000021'),
(22, 'Kavita Joshi', 'F', 'kavita22@gmail.com', '9000000022', '1998-05-17', '2023-03-12', 42000.00, 102, 'ACTIVE', '9100000022'),
(23, 'Amit Kulkarni', 'M', 'amit23@gmail.com', '9000000023', '1993-08-05', '2018-11-20', 62000.00, 103, 'ACTIVE', '9100000023'),
(24, 'Riya Deshmukh', 'F', 'riya24@gmail.com', '9000000024', '1997-12-09', '2022-05-18', 47000.00, 104, 'ACTIVE', '9100000024'),
(25, 'Sahil Jain', 'M', 'sahil25@gmail.com', '9000000025', '1995-03-16', '2020-06-22', 53000.00, 105, 'ACTIVE', '9100000025'),
(26, 'Meera Nair', 'F', 'meera26@gmail.com', '9000000026', '1996-09-28', '2021-08-14', 50000.00, 106, 'ON LEAVE', '9100000026'),
(27, 'Arjun Malhotra', 'M', 'arjun27@gmail.com', '9000000027', '1992-04-19', '2017-10-11', 65000.00, 107, 'ACTIVE', '9100000027'),
(28, 'Isha Mehta', 'F', 'isha28@gmail.com', '9000000028', '1999-01-07', '2023-06-15', 41000.00, 108, 'ACTIVE', '9100000028'),
(29, 'Manish Kumar', 'M', 'manish29@gmail.com', '9000000029', '1994-07-23', '2019-02-10', 57000.00, 109, 'ACTIVE', '9100000029'),
(30, 'Simran Kaur', 'F', 'simran30@gmail.com', '9000000030', '1997-11-30', '2022-01-05', 46000.00, 110, 'ACTIVE', '9100000030'),

(31, 'Nitin Verma', 'M', 'nitin31@gmail.com', '9000000031', '1993-02-12', '2018-05-17', 59000.00, 101, 'ACTIVE', '9100000031'),
(32, 'Ayesha Khan', 'F', 'ayesha32@gmail.com', '9000000032', '1998-06-24', '2023-02-08', 44000.00, 102, 'ACTIVE', '9100000032'),
(33, 'Mohit Agarwal', 'M', 'mohit33@gmail.com', '9000000033', '1995-10-13', '2020-09-25', 52000.00, 103, 'ON LEAVE', '9100000033'),
(34, 'Tanvi Rao', 'F', 'tanvi34@gmail.com', '9000000034', '1996-03-29', '2021-07-19', 48000.00, 104, 'ACTIVE', '9100000034'),
(35, 'Abhishek Singh', 'M', 'abhishek35@gmail.com', '9000000035', '1992-12-05', '2017-04-21', 67000.00, 105, 'ACTIVE', '9100000035'),
(36, 'Madhuri Patil', 'F', 'madhuri36@gmail.com', '9000000036', '1997-08-16', '2022-10-10', 47000.00, 106, 'ACTIVE', '9100000036'),
(37, 'Suresh Nair', 'M', 'suresh37@gmail.com', '9000000037', '1991-05-09', '2016-08-12', 70000.00, 107, 'ACTIVE', '9100000037'),
(38, 'Komal Shah', 'F', 'komal38@gmail.com', '9000000038', '1998-10-27', '2023-04-18', 43000.00, 108, 'ACTIVE', '9100000038'),
(39, 'Yash Desai', 'M', 'yash39@gmail.com', '9000000039', '1995-01-31', '2020-03-14', 54000.00, 109, 'ON LEAVE', '9100000039'),
(40, 'Priyanka Joshi', 'F', 'priyanka40@gmail.com', '9000000040', '1996-05-20', '2021-12-02', 49000.00, 110, 'ACTIVE', '9100000040'),

(41, 'Akash Mehta', 'M', 'akash41@gmail.com', '9000000041', '1994-09-15', '2019-06-11', 56000.00, 101, 'ACTIVE', '9100000041'),
(42, 'Shreya Kulkarni', 'F', 'shreya42@gmail.com', '9000000042', '1998-02-18', '2023-01-22', 43000.00, 102, 'ACTIVE', '9100000042'),
(43, 'Rakesh Sharma', 'M', 'rakesh43@gmail.com', '9000000043', '1992-07-07', '2017-09-19', 64000.00, 103, 'ACTIVE', '9100000043'),
(44, 'Ananya Gupta', 'F', 'ananya44@gmail.com', '9000000044', '1997-04-26', '2022-04-15', 48000.00, 104, 'ON LEAVE', '9100000044'),
(45, 'Harsh Patel', 'M', 'harsh45@gmail.com', '9000000045', '1995-11-11', '2020-10-08', 53000.00, 105, 'ACTIVE', '9100000045'),
(46, 'Divya Singh', 'F', 'divya46@gmail.com', '9000000046', '1996-08-03', '2021-05-20', 50000.00, 106, 'ACTIVE', '9100000046'),
(47, 'Aman Jain', 'M', 'aman47@gmail.com', '9000000047', '1993-03-14', '2018-12-10', 61000.00, 107, 'ACTIVE', '9100000047'),
(48, 'Muskan Verma', 'F', 'muskan48@gmail.com', '9000000048', '1999-06-12', '2023-07-05', 42000.00, 108, 'ACTIVE', '9100000048'),
(49, 'Ritesh Shah', 'M', 'ritesh49@gmail.com', '9000000049', '1994-10-20', '2019-11-18', 55000.00, 109, 'ACTIVE', '9100000049'),
(50, 'Payal Mehta', 'F', 'payal50@gmail.com', '9000000050', '1997-01-25', '2022-02-28', 46000.00, 110, 'ON LEAVE', '9100000050'),

(51, 'Gaurav Rao', 'M', 'gaurav51@gmail.com', '9000000051', '1993-06-18', '2018-03-12', 60000.00, 101, 'ACTIVE', '9100000051'),
(52, 'Snehal Patil', 'F', 'snehal52@gmail.com', '9000000052', '1998-09-22', '2023-03-25', 44000.00, 102, 'ACTIVE', '9100000052'),
(53, 'Vivek Kumar', 'M', 'vivek53@gmail.com', '9000000053', '1992-01-09', '2017-06-15', 66000.00, 103, 'ACTIVE', '9100000053'),
(54, 'Reena Nair', 'F', 'reena54@gmail.com', '9000000054', '1996-12-17', '2021-09-10', 49000.00, 104, 'ACTIVE', '9100000054'),
(55, 'Abhinav Singh', 'M', 'abhinav55@gmail.com', '9000000055', '1995-05-28', '2020-01-20', 54000.00, 105, 'ON LEAVE', '9100000055'),
(56, 'Monika Shah', 'F', 'monika56@gmail.com', '9000000056', '1997-07-14', '2022-06-08', 47000.00, 106, 'ACTIVE', '9100000056'),
(57, 'Sanjay Gupta', 'M', 'sanjay57@gmail.com', '9000000057', '1991-11-23', '2016-11-12', 72000.00, 107, 'ACTIVE', '9100000057'),
(58, 'Radhika Joshi', 'F', 'radhika58@gmail.com', '9000000058', '1998-04-11', '2023-05-15', 43000.00, 108, 'ACTIVE', '9100000058'),
(59, 'Tarun Mehta', 'M', 'tarun59@gmail.com', '9000000059', '1994-02-26', '2019-08-05', 57000.00, 109, 'ACTIVE', '9100000059'),
(60, 'Neelam Rao', 'F', 'neelam60@gmail.com', '9000000060', '1996-10-08', '2021-01-18', 48000.00, 110, 'ACTIVE', '9100000060'),

(61, 'Kunal Patil', 'M', 'kunal61@gmail.com', '9000000061', '1993-07-19', '2018-09-22', 59000.00, 101, 'ACTIVE', '9100000061'),
(62, 'Shweta Sharma', 'F', 'shweta62@gmail.com', '9000000062', '1997-03-05', '2022-08-14', 46000.00, 102, 'ON LEAVE', '9100000062'),
(63, 'Rohit Desai', 'M', 'rohit63@gmail.com', '9000000063', '1995-12-13', '2020-05-11', 53000.00, 103, 'ACTIVE', '9100000063'),
(64, 'Pallavi Shah', 'F', 'pallavi64@gmail.com', '9000000064', '1998-06-29', '2023-02-20', 42000.00, 104, 'ACTIVE', '9100000064'),
(65, 'Sameer Khan', 'M', 'sameer65@gmail.com', '9000000065', '1992-09-07', '2017-12-15', 65000.00, 105, 'ACTIVE', '9100000065'),
(66, 'Aarti Mehta', 'F', 'aarti66@gmail.com', '9000000066', '1996-01-21', '2021-04-10', 49000.00, 106, 'ACTIVE', '9100000066'),
(67, 'Rajesh Kumar', 'M', 'rajesh67@gmail.com', '9000000067', '1991-06-16', '2016-05-20', 71000.00, 107, 'ACTIVE', '9100000067'),
(68, 'Shalini Gupta', 'F', 'shalini68@gmail.com', '9000000068', '1997-11-04', '2022-11-08', 47000.00, 108, 'ON LEAVE', '9100000068'),
(69, 'Sandeep Verma', 'M', 'sandeep69@gmail.com', '9000000069', '1994-04-25', '2019-10-15', 56000.00, 109, 'ACTIVE', '9100000069'),
(70, 'Nisha Yadav', 'F', 'nisha70@gmail.com', '9000000070', '1998-08-30', '2023-06-20', 43000.00, 110, 'ACTIVE', '9100000070'),

(71, 'Varun Patel', 'M', 'varun71@gmail.com', '9000000071', '1993-10-12', '2018-02-18', 62000.00, 101, 'ACTIVE', '9100000071'),
(72, 'Simran Desai', 'F', 'simran72@gmail.com', '9000000072', '1997-05-23', '2022-03-14', 48000.00, 102, 'ACTIVE', '9100000072'),
(73, 'Deepak Rao', 'M', 'deepak73@gmail.com', '9000000073', '1995-02-08', '2020-07-11', 52000.00, 103, 'ON LEAVE', '9100000073'),
(74, 'Tanvi Kulkarni', 'F', 'tanvi74@gmail.com', '9000000074', '1999-09-19', '2023-04-12', 41000.00, 104, 'ACTIVE', '9100000074'),
(75, 'Nikhil Sharma', 'M', 'nikhil75@gmail.com', '9000000075', '1992-12-28', '2017-08-20', 68000.00, 105, 'ACTIVE', '9100000075'),
(76, 'Ritu Mehta', 'F', 'ritu76@gmail.com', '9000000076', '1996-07-03', '2021-10-10', 50000.00, 106, 'ACTIVE', '9100000076'),
(77, 'Siddharth Jain', 'M', 'siddharth77@gmail.com', '9000000077', '1994-11-17', '2019-01-15', 57000.00, 107, 'ACTIVE', '9100000077'),
(78, 'Kiran Shah', 'F', 'kiran78@gmail.com', '9000000078', '1998-03-26', '2023-01-30', 44000.00, 108, 'ON LEAVE', '9100000078'),
(79, 'Yashwant Singh', 'M', 'yashwant79@gmail.com', '9000000079', '1991-08-14', '2016-09-10', 73000.00, 109, 'ACTIVE', '9100000079'),
(80, 'Mansi Joshi', 'F', 'mansi80@gmail.com', '9000000080', '1997-10-06', '2022-07-22', 47000.00, 110, 'ACTIVE', '9100000080'),

(81, 'Akshay Nair', 'M', 'akshay81@gmail.com', '9000000081', '1993-05-11', '2018-06-18', 60000.00, 101, 'ACTIVE', '9100000081'),
(82, 'Poonam Patil', 'F', 'poonam82@gmail.com', '9000000082', '1998-01-29', '2023-03-10', 43000.00, 102, 'ACTIVE', '9100000082'),
(83, 'Ravi Kumar', 'M', 'ravi83@gmail.com', '9000000083', '1994-09-23', '2019-12-12', 55000.00, 103, 'ACTIVE', '9100000083'),
(84, 'Nandini Rao', 'F', 'nandini84@gmail.com', '9000000084', '1997-06-15', '2022-05-20', 48000.00, 104, 'ON LEAVE', '9100000084'),
(85, 'Manav Shah', 'M', 'manav85@gmail.com', '9000000085', '1995-03-27', '2020-11-15', 53000.00, 105, 'ACTIVE', '9100000085'),
(86, 'Rashmi Gupta', 'F', 'rashmi86@gmail.com', '9000000086', '1996-12-02', '2021-02-10', 49000.00, 106, 'ACTIVE', '9100000086'),
(87, 'Harish Verma', 'M', 'harish87@gmail.com', '9000000087', '1992-07-18', '2017-03-20', 67000.00, 107, 'ACTIVE', '9100000087'),
(88, 'Bhavna Mehta', 'F', 'bhavna88@gmail.com', '9000000088', '1998-10-09', '2023-07-15', 42000.00, 108, 'ACTIVE', '9100000088'),
(89, 'Chirag Joshi', 'M', 'chirag89@gmail.com', '9000000089', '1993-04-21', '2018-10-05', 61000.00, 109, 'ON LEAVE', '9100000089'),
(90, 'Lavanya Singh', 'F', 'lavanya90@gmail.com', '9000000090', '1997-02-16', '2022-09-20', 46000.00, 110, 'ACTIVE', '9100000090'),

(91, 'Omkar Patil', 'M', 'omkar91@gmail.com', '9000000091', '1994-06-08', '2019-05-14', 56000.00, 101, 'ACTIVE', '9100000091'),
(92, 'Kriti Sharma', 'F', 'kriti92@gmail.com', '9000000092', '1999-01-18', '2023-02-15', 41000.00, 102, 'ACTIVE', '9100000092'),
(93, 'Saurabh Nair', 'M', 'saurabh93@gmail.com', '9000000093', '1992-11-26', '2017-07-10', 69000.00, 103, 'ACTIVE', '9100000093'),
(94, 'Rashika Shah', 'F', 'rashika94@gmail.com', '9000000094', '1996-04-13', '2021-06-20', 48000.00, 104, 'ON LEAVE', '9100000094'),
(95, 'Pranav Mehta', 'M', 'pranav95@gmail.com', '9000000095', '1995-08-29', '2020-04-15', 54000.00, 105, 'ACTIVE', '9100000095'),
(96, 'Sakshi Joshi', 'F', 'sakshi96@gmail.com', '9000000096', '1998-07-11', '2023-05-20', 43000.00, 106, 'ACTIVE', '9100000096'),
(97, 'Vishal Kumar', 'M', 'vishal97@gmail.com', '9000000097', '1991-02-24', '2016-12-10', 72000.00, 107, 'ACTIVE', '9100000097'),
(98, 'Rhea Kapoor', 'F', 'rhea98@gmail.com', '9000000098', '1997-09-05', '2022-10-15', 47000.00, 108, 'ACTIVE', '9100000098'),
(99, 'Maulik Patel', 'M', 'maulik99@gmail.com', '9000000099', '1993-12-19', '2018-04-18', 63000.00, 109, 'ON LEAVE', '9100000099'),
(100, 'Aditi Rao', 'F', 'aditi100@gmail.com', '9000000100', '1996-05-07', '2021-11-12', 50000.00, 110, 'ACTIVE', '9100000100');

select count(*) as total_records
from flight_attendant;


show create table passenger;

-- q93. insert 90 additional records into the passenger table.
insert into passenger
(passenger_id, first_name, last_name, gender, email, phone, city, date_of_birth, passport_number)
values
(11, 'Aarav', 'Sharma', 'M', 'aarav11@gmail.com', '9001000011', 'Mumbai', '1995-01-15', 'P1000011'),
(12, 'Ananya', 'Patil', 'F', 'ananya12@gmail.com', '9001000012', 'Pune', '1997-03-22', 'P1000012'),
(13, 'Rohan', 'Mehta', 'M', 'rohan13@gmail.com', '9001000013', 'Delhi', '1994-05-10', 'P1000013'),
(14, 'Priya', 'Shah', 'F', 'priya14@gmail.com', '9001000014', 'Mumbai', '1996-07-18', 'P1000014'),
(15, 'Karan', 'Joshi', 'M', 'karan15@gmail.com', '9001000015', 'Nashik', '1993-09-12', 'P1000015'),
(16, 'Sneha', 'Rao', 'F', 'sneha16@gmail.com', '9001000016', 'Pune', '1998-02-25', 'P1000016'),
(17, 'Vikram', 'Singh', 'M', 'vikram17@gmail.com', '9001000017', 'Delhi', '1992-11-08', 'P1000017'),
(18, 'Neha', 'Kapoor', 'F', 'neha18@gmail.com', '9001000018', 'Bangalore', '1997-04-14', 'P1000018'),
(19, 'Aditya', 'Verma', 'M', 'aditya19@gmail.com', '9001000019', 'Mumbai', '1995-06-30', 'P1000019'),
(20, 'Pooja', 'Gupta', 'F', 'pooja20@gmail.com', '9001000020', 'Jaipur', '1996-10-21', 'P1000020'),

(21, 'Rahul', 'Nair', 'M', 'rahul21@gmail.com', '9001000021', 'Kochi', '1994-01-11', 'P1000021'),
(22, 'Kavita', 'Joshi', 'F', 'kavita22@gmail.com', '9001000022', 'Pune', '1998-05-17', 'P1000022'),
(23, 'Amit', 'Kulkarni', 'M', 'amit23@gmail.com', '9001000023', 'Mumbai', '1993-08-05', 'P1000023'),
(24, 'Riya', 'Deshmukh', 'F', 'riya24@gmail.com', '9001000024', 'Nagpur', '1997-12-09', 'P1000024'),
(25, 'Sahil', 'Jain', 'M', 'sahil25@gmail.com', '9001000025', 'Delhi', '1995-03-16', 'P1000025'),
(26, 'Meera', 'Nair', 'F', 'meera26@gmail.com', '9001000026', 'Kochi', '1996-09-28', 'P1000026'),
(27, 'Arjun', 'Malhotra', 'M', 'arjun27@gmail.com', '9001000027', 'Mumbai', '1992-04-19', 'P1000027'),
(28, 'Isha', 'Mehta', 'F', 'isha28@gmail.com', '9001000028', 'Chennai', '1999-01-07', 'P1000028'),
(29, 'Manish', 'Kumar', 'M', 'manish29@gmail.com', '9001000029', 'Delhi', '1994-07-23', 'P1000029'),
(30, 'Simran', 'Kaur', 'F', 'simran30@gmail.com', '9001000030', 'Amritsar', '1997-11-30', 'P1000030'),

(31, 'Nitin', 'Verma', 'M', 'nitin31@gmail.com', '9001000031', 'Lucknow', '1993-02-12', 'P1000031'),
(32, 'Ayesha', 'Khan', 'F', 'ayesha32@gmail.com', '9001000032', 'Hyderabad', '1998-06-24', 'P1000032'),
(33, 'Mohit', 'Agarwal', 'M', 'mohit33@gmail.com', '9001000033', 'Delhi', '1995-10-13', 'P1000033'),
(34, 'Tanvi', 'Rao', 'F', 'tanvi34@gmail.com', '9001000034', 'Bangalore', '1996-03-29', 'P1000034'),
(35, 'Abhishek', 'Singh', 'M', 'abhishek35@gmail.com', '9001000035', 'Mumbai', '1992-12-05', 'P1000035'),
(36, 'Madhuri', 'Patil', 'F', 'madhuri36@gmail.com', '9001000036', 'Pune', '1997-08-16', 'P1000036'),
(37, 'Suresh', 'Nair', 'M', 'suresh37@gmail.com', '9001000037', 'Kochi', '1991-05-09', 'P1000037'),
(38, 'Komal', 'Shah', 'F', 'komal38@gmail.com', '9001000038', 'Ahmedabad', '1998-10-27', 'P1000038'),
(39, 'Yash', 'Desai', 'M', 'yash39@gmail.com', '9001000039', 'Surat', '1995-01-31', 'P1000039'),
(40, 'Priyanka', 'Joshi', 'F', 'priyanka40@gmail.com', '9001000040', 'Mumbai', '1996-05-20', 'P1000040'),

(41, 'Akash', 'Mehta', 'M', 'akash41@gmail.com', '9001000041', 'Pune', '1994-09-15', 'P1000041'),
(42, 'Shreya', 'Kulkarni', 'F', 'shreya42@gmail.com', '9001000042', 'Mumbai', '1998-02-18', 'P1000042'),
(43, 'Rakesh', 'Sharma', 'M', 'rakesh43@gmail.com', '9001000043', 'Delhi', '1992-07-07', 'P1000043'),
(44, 'Ananya', 'Gupta', 'F', 'ananya44@gmail.com', '9001000044', 'Jaipur', '1997-04-26', 'P1000044'),
(45, 'Harsh', 'Patel', 'M', 'harsh45@gmail.com', '9001000045', 'Ahmedabad', '1995-11-11', 'P1000045'),
(46, 'Divya', 'Singh', 'F', 'divya46@gmail.com', '9001000046', 'Delhi', '1996-08-03', 'P1000046'),
(47, 'Aman', 'Jain', 'M', 'aman47@gmail.com', '9001000047', 'Mumbai', '1993-03-14', 'P1000047'),
(48, 'Muskan', 'Verma', 'F', 'muskan48@gmail.com', '9001000048', 'Lucknow', '1999-06-12', 'P1000048'),
(49, 'Ritesh', 'Shah', 'M', 'ritesh49@gmail.com', '9001000049', 'Pune', '1994-10-20', 'P1000049'),
(50, 'Payal', 'Mehta', 'F', 'payal50@gmail.com', '9001000050', 'Mumbai', '1997-01-25', 'P1000050'),

(51, 'Gaurav', 'Rao', 'M', 'gaurav51@gmail.com', '9001000051', 'Bangalore', '1993-06-18', 'P1000051'),
(52, 'Snehal', 'Patil', 'F', 'snehal52@gmail.com', '9001000052', 'Pune', '1998-09-22', 'P1000052'),
(53, 'Vivek', 'Kumar', 'M', 'vivek53@gmail.com', '9001000053', 'Delhi', '1992-01-09', 'P1000053'),
(54, 'Reena', 'Nair', 'F', 'reena54@gmail.com', '9001000054', 'Kochi', '1996-12-17', 'P1000054'),
(55, 'Abhinav', 'Singh', 'M', 'abhinav55@gmail.com', '9001000055', 'Mumbai', '1995-05-28', 'P1000055'),
(56, 'Monika', 'Shah', 'F', 'monika56@gmail.com', '9001000056', 'Ahmedabad', '1997-07-14', 'P1000056'),
(57, 'Sanjay', 'Gupta', 'M', 'sanjay57@gmail.com', '9001000057', 'Delhi', '1991-11-23', 'P1000057'),
(58, 'Radhika', 'Joshi', 'F', 'radhika58@gmail.com', '9001000058', 'Pune', '1998-04-11', 'P1000058'),
(59, 'Tarun', 'Mehta', 'M', 'tarun59@gmail.com', '9001000059', 'Mumbai', '1994-02-26', 'P1000059'),
(60, 'Neelam', 'Rao', 'F', 'neelam60@gmail.com', '9001000060', 'Chennai', '1996-10-08', 'P1000060'),

(61, 'Kunal', 'Patil', 'M', 'kunal61@gmail.com', '9001000061', 'Nashik', '1993-07-19', 'P1000061'),
(62, 'Shweta', 'Sharma', 'F', 'shweta62@gmail.com', '9001000062', 'Mumbai', '1997-03-05', 'P1000062'),
(63, 'Rohit', 'Desai', 'M', 'rohit63@gmail.com', '9001000063', 'Surat', '1995-12-13', 'P1000063'),
(64, 'Pallavi', 'Shah', 'F', 'pallavi64@gmail.com', '9001000064', 'Ahmedabad', '1998-06-29', 'P1000064'),
(65, 'Sameer', 'Khan', 'M', 'sameer65@gmail.com', '9001000065', 'Hyderabad', '1992-09-07', 'P1000065'),
(66, 'Aarti', 'Mehta', 'F', 'aarti66@gmail.com', '9001000066', 'Delhi', '1996-01-21', 'P1000066'),
(67, 'Rajesh', 'Kumar', 'M', 'rajesh67@gmail.com', '9001000067', 'Mumbai', '1991-06-16', 'P1000067'),
(68, 'Shalini', 'Gupta', 'F', 'shalini68@gmail.com', '9001000068', 'Pune', '1997-11-04', 'P1000068'),
(69, 'Sandeep', 'Verma', 'M', 'sandeep69@gmail.com', '9001000069', 'Lucknow', '1994-04-25', 'P1000069'),
(70, 'Nisha', 'Yadav', 'F', 'nisha70@gmail.com', '9001000070', 'Delhi', '1998-08-30', 'P1000070'),

(71, 'Varun', 'Patel', 'M', 'varun71@gmail.com', '9001000071', 'Surat', '1993-10-12', 'P1000071'),
(72, 'Simran', 'Desai', 'F', 'simran72@gmail.com', '9001000072', 'Mumbai', '1997-05-23', 'P1000072'),
(73, 'Deepak', 'Rao', 'M', 'deepak73@gmail.com', '9001000073', 'Bangalore', '1995-02-08', 'P1000073'),
(74, 'Tanvi', 'Kulkarni', 'F', 'tanvi74@gmail.com', '9001000074', 'Pune', '1999-09-19', 'P1000074'),
(75, 'Nikhil', 'Sharma', 'M', 'nikhil75@gmail.com', '9001000075', 'Delhi', '1992-12-28', 'P1000075'),
(76, 'Ritu', 'Mehta', 'F', 'ritu76@gmail.com', '9001000076', 'Mumbai', '1996-07-03', 'P1000076'),
(77, 'Siddharth', 'Jain', 'M', 'siddharth77@gmail.com', '9001000077', 'Jaipur', '1994-11-17', 'P1000077'),
(78, 'Kiran', 'Shah', 'F', 'kiran78@gmail.com', '9001000078', 'Ahmedabad', '1998-03-26', 'P1000078'),
(79, 'Yashwant', 'Singh', 'M', 'yashwant79@gmail.com', '9001000079', 'Mumbai', '1991-08-14', 'P1000079'),
(80, 'Mansi', 'Joshi', 'F', 'mansi80@gmail.com', '9001000080', 'Pune', '1997-10-06', 'P1000080'),

(81, 'Akshay', 'Nair', 'M', 'akshay81@gmail.com', '9001000081', 'Kochi', '1993-05-11', 'P1000081'),
(82, 'Poonam', 'Patil', 'F', 'poonam82@gmail.com', '9001000082', 'Mumbai', '1998-01-29', 'P1000082'),
(83, 'Ravi', 'Kumar', 'M', 'ravi83@gmail.com', '9001000083', 'Delhi', '1994-09-23', 'P1000083'),
(84, 'Nandini', 'Rao', 'F', 'nandini84@gmail.com', '9001000084', 'Bangalore', '1997-06-15', 'P1000084'),
(85, 'Manav', 'Shah', 'M', 'manav85@gmail.com', '9001000085', 'Mumbai', '1995-03-27', 'P1000085'),
(86, 'Rashmi', 'Gupta', 'F', 'rashmi86@gmail.com', '9001000086', 'Pune', '1996-12-02', 'P1000086'),
(87, 'Harish', 'Verma', 'M', 'harish87@gmail.com', '9001000087', 'Lucknow', '1992-07-18', 'P1000087'),
(88, 'Bhavna', 'Mehta', 'F', 'bhavna88@gmail.com', '9001000088', 'Delhi', '1998-10-09', 'P1000088'),
(89, 'Chirag', 'Joshi', 'M', 'chirag89@gmail.com', '9001000089', 'Mumbai', '1993-04-21', 'P1000089'),
(90, 'Lavanya', 'Singh', 'F', 'lavanya90@gmail.com', '9001000090', 'Jaipur', '1997-02-16', 'P1000090'),

(91, 'Omkar', 'Patil', 'M', 'omkar91@gmail.com', '9001000091', 'Pune', '1994-06-08', 'P1000091'),
(92, 'Kriti', 'Sharma', 'F', 'kriti92@gmail.com', '9001000092', 'Mumbai', '1999-01-18', 'P1000092'),
(93, 'Saurabh', 'Nair', 'M', 'saurabh93@gmail.com', '9001000093', 'Kochi', '1992-11-26', 'P1000093'),
(94, 'Rashika', 'Shah', 'F', 'rashika94@gmail.com', '9001000094', 'Ahmedabad', '1996-04-13', 'P1000094'),
(95, 'Pranav', 'Mehta', 'M', 'pranav95@gmail.com', '9001000095', 'Delhi', '1995-08-29', 'P1000095'),
(96, 'Sakshi', 'Joshi', 'F', 'sakshi96@gmail.com', '9001000096', 'Mumbai', '1998-07-11', 'P1000096'),
(97, 'Vishal', 'Kumar', 'M', 'vishal97@gmail.com', '9001000097', 'Pune', '1991-02-24', 'P1000097'),
(98, 'Rhea', 'Kapoor', 'F', 'rhea98@gmail.com', '9001000098', 'Bangalore', '1997-09-05', 'P1000098'),
(99, 'Maulik', 'Patel', 'M', 'maulik99@gmail.com', '9001000099', 'Surat', '1993-12-19', 'P1000099'),
(100, 'Aditi', 'Rao', 'F', 'aditi100@gmail.com', '9001000100', 'Mumbai', '1996-05-07', 'P1000100');

select count(*) as total_records
from passenger;

-- q94. insert 90 additional records into the booking table.
insert into booking
(booking_id, passenger_id, flight_id, booking_date, journey_date, seat_number, fare, booking_status)
values
(11, 11, 11, '2026-09-01', '2026-10-01', '1A', 4500.00, 'CONFIRMED'),
(12, 12, 12, '2026-09-01', '2026-10-01', '1B', 5200.00, 'CONFIRMED'),
(13, 13, 13, '2026-09-02', '2026-10-01', '2A', 4800.00, 'CONFIRMED'),
(14, 14, 14, '2026-09-02', '2026-10-01', '2B', 5500.00, 'CONFIRMED'),
(15, 15, 15, '2026-09-03', '2026-10-01', '3A', 6200.00, 'CONFIRMED'),
(16, 16, 16, '2026-09-03', '2026-10-01', '3B', 4900.00, 'CONFIRMED'),
(17, 17, 17, '2026-09-04', '2026-10-01', '4A', 5700.00, 'CONFIRMED'),
(18, 18, 18, '2026-09-04', '2026-10-01', '4B', 6100.00, 'CONFIRMED'),
(19, 19, 19, '2026-09-05', '2026-10-01', '5A', 5300.00, 'CONFIRMED'),
(20, 20, 20, '2026-09-05', '2026-10-01', '5B', 4600.00, 'CONFIRMED'),

(21, 21, 21, '2026-09-06', '2026-10-02', '6A', 5100.00, 'CONFIRMED'),
(22, 22, 22, '2026-09-06', '2026-10-02', '6B', 5800.00, 'CONFIRMED'),
(23, 23, 23, '2026-09-07', '2026-10-02', '7A', 6300.00, 'CONFIRMED'),
(24, 24, 24, '2026-09-07', '2026-10-02', '7B', 4900.00, 'CONFIRMED'),
(25, 25, 25, '2026-09-08', '2026-10-02', '8A', 5400.00, 'CONFIRMED'),
(26, 26, 26, '2026-09-08', '2026-10-02', '8B', 6000.00, 'CONFIRMED'),
(27, 27, 27, '2026-09-09', '2026-10-02', '9A', 4700.00, 'CONFIRMED'),
(28, 28, 28, '2026-09-09', '2026-10-02', '9B', 5600.00, 'CONFIRMED'),
(29, 29, 29, '2026-09-10', '2026-10-02', '10A', 6200.00, 'CONFIRMED'),
(30, 30, 30, '2026-09-10', '2026-10-02', '10B', 5000.00, 'CONFIRMED'),

(31, 31, 31, '2026-09-11', '2026-10-03', '11A', 4800.00, 'CONFIRMED'),
(32, 32, 32, '2026-09-11', '2026-10-03', '11B', 5500.00, 'CONFIRMED'),
(33, 33, 33, '2026-09-12', '2026-10-03', '12A', 5900.00, 'CONFIRMED'),
(34, 34, 34, '2026-09-12', '2026-10-03', '12B', 5100.00, 'CONFIRMED'),
(35, 35, 35, '2026-09-13', '2026-10-03', '13A', 6500.00, 'CONFIRMED'),
(36, 36, 36, '2026-09-13', '2026-10-03', '13B', 4700.00, 'CONFIRMED'),
(37, 37, 37, '2026-09-14', '2026-10-03', '14A', 5300.00, 'CONFIRMED'),
(38, 38, 38, '2026-09-14', '2026-10-03', '14B', 6100.00, 'CONFIRMED'),
(39, 39, 39, '2026-09-15', '2026-10-03', '15A', 5700.00, 'CONFIRMED'),
(40, 40, 40, '2026-09-15', '2026-10-03', '15B', 4900.00, 'CONFIRMED'),

(41, 41, 41, '2026-09-16', '2026-10-04', '16A', 5200.00, 'CONFIRMED'),
(42, 42, 42, '2026-09-16', '2026-10-04', '16B', 6000.00, 'CONFIRMED'),
(43, 43, 43, '2026-09-17', '2026-10-04', '17A', 4600.00, 'CONFIRMED'),
(44, 44, 44, '2026-09-17', '2026-10-04', '17B', 5800.00, 'CONFIRMED'),
(45, 45, 45, '2026-09-18', '2026-10-04', '18A', 6300.00, 'CONFIRMED'),
(46, 46, 46, '2026-09-18', '2026-10-04', '18B', 5100.00, 'CONFIRMED'),
(47, 47, 47, '2026-09-19', '2026-10-04', '19A', 5500.00, 'CONFIRMED'),
(48, 48, 48, '2026-09-19', '2026-10-04', '19B', 4900.00, 'CONFIRMED'),
(49, 49, 49, '2026-09-20', '2026-10-04', '20A', 6100.00, 'CONFIRMED'),
(50, 50, 50, '2026-09-20', '2026-10-04', '20B', 5300.00, 'CONFIRMED'),

(51, 51, 51, '2026-09-21', '2026-10-05', '21A', 4700.00, 'CONFIRMED'),
(52, 52, 52, '2026-09-21', '2026-10-05', '21B', 5900.00, 'CONFIRMED'),
(53, 53, 53, '2026-09-22', '2026-10-05', '22A', 5400.00, 'CONFIRMED'),
(54, 54, 54, '2026-09-22', '2026-10-05', '22B', 6200.00, 'CONFIRMED'),
(55, 55, 55, '2026-09-23', '2026-10-05', '23A', 5000.00, 'CONFIRMED'),
(56, 56, 56, '2026-09-23', '2026-10-05', '23B', 5700.00, 'CONFIRMED'),
(57, 57, 57, '2026-09-24', '2026-10-05', '24A', 6400.00, 'CONFIRMED'),
(58, 58, 58, '2026-09-24', '2026-10-05', '24B', 4800.00, 'CONFIRMED'),
(59, 59, 59, '2026-09-25', '2026-10-05', '25A', 5600.00, 'CONFIRMED'),
(60, 60, 60, '2026-09-25', '2026-10-05', '25B', 5100.00, 'CONFIRMED'),

(61, 61, 61, '2026-09-26', '2026-10-06', '26A', 6000.00, 'CONFIRMED'),
(62, 62, 62, '2026-09-26', '2026-10-06', '26B', 4700.00, 'CONFIRMED'),
(63, 63, 63, '2026-09-27', '2026-10-06', '27A', 5800.00, 'CONFIRMED'),
(64, 64, 64, '2026-09-27', '2026-10-06', '27B', 5300.00, 'CONFIRMED'),
(65, 65, 65, '2026-09-28', '2026-10-06', '28A', 6200.00, 'CONFIRMED'),
(66, 66, 66, '2026-09-28', '2026-10-06', '28B', 4900.00, 'CONFIRMED'),
(67, 67, 67, '2026-09-29', '2026-10-06', '29A', 5500.00, 'CONFIRMED'),
(68, 68, 68, '2026-09-29', '2026-10-06', '29B', 6100.00, 'CONFIRMED'),
(69, 69, 69, '2026-09-30', '2026-10-06', '30A', 5200.00, 'CONFIRMED'),
(70, 70, 70, '2026-09-30', '2026-10-06', '30B', 5900.00, 'CONFIRMED'),

(71, 71, 71, '2026-10-01', '2026-10-07', '31A', 4600.00, 'CONFIRMED'),
(72, 72, 72, '2026-10-01', '2026-10-07', '31B', 5700.00, 'CONFIRMED'),
(73, 73, 73, '2026-10-02', '2026-10-07', '32A', 6300.00, 'CONFIRMED'),
(74, 74, 74, '2026-10-02', '2026-10-07', '32B', 5000.00, 'CONFIRMED'),
(75, 75, 75, '2026-10-03', '2026-10-07', '33A', 5400.00, 'CONFIRMED'),
(76, 76, 76, '2026-10-03', '2026-10-07', '33B', 6000.00, 'CONFIRMED'),
(77, 77, 77, '2026-10-04', '2026-10-07', '34A', 4800.00, 'CONFIRMED'),
(78, 78, 78, '2026-10-04', '2026-10-07', '34B', 5500.00, 'CONFIRMED'),
(79, 79, 79, '2026-10-05', '2026-10-07', '35A', 6200.00, 'CONFIRMED'),
(80, 80, 80, '2026-10-05', '2026-10-07', '35B', 5100.00, 'CONFIRMED'),

(81, 81, 81, '2026-10-06', '2026-10-08', '36A', 5800.00, 'CONFIRMED'),
(82, 82, 82, '2026-10-06', '2026-10-08', '36B', 4900.00, 'CONFIRMED'),
(83, 83, 83, '2026-10-07', '2026-10-08', '37A', 5600.00, 'CONFIRMED'),
(84, 84, 84, '2026-10-07', '2026-10-08', '37B', 6400.00, 'CONFIRMED'),
(85, 85, 85, '2026-10-08', '2026-10-08', '38A', 5300.00, 'CONFIRMED'),
(86, 86, 86, '2026-10-08', '2026-10-08', '38B', 4700.00, 'CONFIRMED'),
(87, 87, 87, '2026-10-01', '2026-10-08', '39A', 6100.00, 'CONFIRMED'),
(88, 88, 88, '2026-10-01', '2026-10-08', '39B', 5200.00, 'CONFIRMED'),
(89, 89, 89, '2026-10-01', '2026-10-08', '40A', 5900.00, 'CONFIRMED'),
(90, 90, 90, '2026-10-01', '2026-10-08', '40B', 5000.00, 'CONFIRMED'),
(91, 91, 91, '2026-10-01', '2026-10-09', '41A', 5400.00, 'CONFIRMED'),
(92, 92, 92, '2026-10-01', '2026-10-09', '41B', 6200.00, 'CONFIRMED'),
(93, 93, 93, '2026-10-01', '2026-10-09', '42A', 4800.00, 'CONFIRMED'),
(94, 94, 94, '2026-10-01', '2026-10-09', '42B', 5700.00, 'CONFIRMED'),
(95, 95, 95, '2026-10-01', '2026-10-09', '43A', 6300.00, 'CONFIRMED'),
(96, 96, 96, '2026-10-01', '2026-10-09', '43B', 5100.00, 'CONFIRMED'),
(97, 97, 97, '2026-10-01', '2026-10-09', '44A', 5500.00, 'CONFIRMED'),
(98, 98, 98, '2026-10-01', '2026-10-09', '44B', 6000.00, 'CONFIRMED'),
(99, 99, 99, '2026-10-01', '2026-10-09', '45A', 5200.00, 'CONFIRMED'),
(100, 100, 100, '2026-10-01', '2026-10-09', '45B', 5800.00, 'CONFIRMED');



select count(*) as total_records
from booking;

-- q95. insert 90 additional records into the payment table.

insert into payment
(payment_id, booking_id, payment_date, amount, payment_method, payment_status, transaction_reference)
values
(11, 11, '2026-09-01', 4500.00, 'UPI', 'SUCCESS', 'TXN1000011'),
(12, 12, '2026-09-01', 5200.00, 'CARD', 'SUCCESS', 'TXN1000012'),
(13, 13, '2026-09-02', 4800.00, 'NETBANKING', 'SUCCESS', 'TXN1000013'),
(14, 14, '2026-09-02', 5500.00, 'UPI', 'SUCCESS', 'TXN1000014'),
(15, 15, '2026-09-03', 6200.00, 'CARD', 'SUCCESS', 'TXN1000015'),
(16, 16, '2026-09-03', 4900.00, 'CASH', 'SUCCESS', 'TXN1000016'),
(17, 17, '2026-09-04', 5700.00, 'UPI', 'SUCCESS', 'TXN1000017'),
(18, 18, '2026-09-04', 6100.00, 'CARD', 'SUCCESS', 'TXN1000018'),
(19, 19, '2026-09-05', 5300.00, 'NETBANKING', 'SUCCESS', 'TXN1000019'),
(20, 20, '2026-09-05', 4600.00, 'UPI', 'SUCCESS', 'TXN1000020'),

(21, 21, '2026-09-06', 5100.00, 'CARD', 'SUCCESS', 'TXN1000021'),
(22, 22, '2026-09-06', 5800.00, 'UPI', 'SUCCESS', 'TXN1000022'),
(23, 23, '2026-09-07', 6300.00, 'NETBANKING', 'SUCCESS', 'TXN1000023'),
(24, 24, '2026-09-07', 4900.00, 'CARD', 'SUCCESS', 'TXN1000024'),
(25, 25, '2026-09-08', 5400.00, 'UPI', 'SUCCESS', 'TXN1000025'),
(26, 26, '2026-09-08', 6000.00, 'CARD', 'SUCCESS', 'TXN1000026'),
(27, 27, '2026-09-09', 4700.00, 'CASH', 'SUCCESS', 'TXN1000027'),
(28, 28, '2026-09-09', 5600.00, 'UPI', 'SUCCESS', 'TXN1000028'),
(29, 29, '2026-09-10', 6200.00, 'CARD', 'SUCCESS', 'TXN1000029'),
(30, 30, '2026-09-10', 5000.00, 'NETBANKING', 'SUCCESS', 'TXN1000030'),

(31, 31, '2026-09-11', 4800.00, 'UPI', 'SUCCESS', 'TXN1000031'),
(32, 32, '2026-09-11', 5500.00, 'CARD', 'SUCCESS', 'TXN1000032'),
(33, 33, '2026-09-12', 5900.00, 'UPI', 'SUCCESS', 'TXN1000033'),
(34, 34, '2026-09-12', 5100.00, 'NETBANKING', 'SUCCESS', 'TXN1000034'),
(35, 35, '2026-09-13', 6500.00, 'CARD', 'SUCCESS', 'TXN1000035'),
(36, 36, '2026-09-13', 4700.00, 'UPI', 'SUCCESS', 'TXN1000036'),
(37, 37, '2026-09-14', 5300.00, 'CARD', 'SUCCESS', 'TXN1000037'),
(38, 38, '2026-09-14', 6100.00, 'NETBANKING', 'SUCCESS', 'TXN1000038'),
(39, 39, '2026-09-15', 5700.00, 'UPI', 'SUCCESS', 'TXN1000039'),
(40, 40, '2026-09-15', 4900.00, 'CARD', 'SUCCESS', 'TXN1000040'),

(41, 41, '2026-09-16', 5200.00, 'UPI', 'SUCCESS', 'TXN1000041'),
(42, 42, '2026-09-16', 6000.00, 'CARD', 'SUCCESS', 'TXN1000042'),
(43, 43, '2026-09-17', 4600.00, 'NETBANKING', 'SUCCESS', 'TXN1000043'),
(44, 44, '2026-09-17', 5800.00, 'UPI', 'SUCCESS', 'TXN1000044'),
(45, 45, '2026-09-18', 6300.00, 'CARD', 'SUCCESS', 'TXN1000045'),
(46, 46, '2026-09-18', 5100.00, 'UPI', 'SUCCESS', 'TXN1000046'),
(47, 47, '2026-09-19', 5500.00, 'NETBANKING', 'SUCCESS', 'TXN1000047'),
(48, 48, '2026-09-19', 4900.00, 'CARD', 'SUCCESS', 'TXN1000048'),
(49, 49, '2026-09-20', 6100.00, 'UPI', 'SUCCESS', 'TXN1000049'),
(50, 50, '2026-09-20', 5300.00, 'CARD', 'SUCCESS', 'TXN1000050'),

(51, 51, '2026-09-21', 4700.00, 'UPI', 'SUCCESS', 'TXN1000051'),
(52, 52, '2026-09-21', 5900.00, 'NETBANKING', 'SUCCESS', 'TXN1000052'),
(53, 53, '2026-09-22', 5400.00, 'CARD', 'SUCCESS', 'TXN1000053'),
(54, 54, '2026-09-22', 6200.00, 'UPI', 'SUCCESS', 'TXN1000054'),
(55, 55, '2026-09-23', 5000.00, 'CARD', 'SUCCESS', 'TXN1000055'),
(56, 56, '2026-09-23', 5700.00, 'NETBANKING', 'SUCCESS', 'TXN1000056'),
(57, 57, '2026-09-24', 6400.00, 'UPI', 'SUCCESS', 'TXN1000057'),
(58, 58, '2026-09-24', 4800.00, 'CARD', 'SUCCESS', 'TXN1000058'),
(59, 59, '2026-09-25', 5600.00, 'UPI', 'SUCCESS', 'TXN1000059'),
(60, 60, '2026-09-25', 5100.00, 'CARD', 'SUCCESS', 'TXN1000060'),

(61, 61, '2026-09-26', 6000.00, 'NETBANKING', 'SUCCESS', 'TXN1000061'),
(62, 62, '2026-09-26', 4700.00, 'UPI', 'SUCCESS', 'TXN1000062'),
(63, 63, '2026-09-27', 5800.00, 'CARD', 'SUCCESS', 'TXN1000063'),
(64, 64, '2026-09-27', 5300.00, 'UPI', 'SUCCESS', 'TXN1000064'),
(65, 65, '2026-09-28', 6200.00, 'NETBANKING', 'SUCCESS', 'TXN1000065'),
(66, 66, '2026-09-28', 4900.00, 'CARD', 'SUCCESS', 'TXN1000066'),
(67, 67, '2026-09-29', 5500.00, 'UPI', 'SUCCESS', 'TXN1000067'),
(68, 68, '2026-09-29', 6100.00, 'CARD', 'SUCCESS', 'TXN1000068'),
(69, 69, '2026-09-30', 5200.00, 'NETBANKING', 'SUCCESS', 'TXN1000069'),
(70, 70, '2026-09-30', 5900.00, 'UPI', 'SUCCESS', 'TXN1000070'),

(71, 71, '2026-10-01', 4600.00, 'CARD', 'SUCCESS', 'TXN1000071'),
(72, 72, '2026-10-01', 5700.00, 'UPI', 'SUCCESS', 'TXN1000072'),
(73, 73, '2026-10-02', 6300.00, 'NETBANKING', 'SUCCESS', 'TXN1000073'),
(74, 74, '2026-10-02', 5000.00, 'CARD', 'SUCCESS', 'TXN1000074'),
(75, 75, '2026-10-03', 5400.00, 'UPI', 'SUCCESS', 'TXN1000075'),
(76, 76, '2026-10-03', 6000.00, 'CARD', 'SUCCESS', 'TXN1000076'),
(77, 77, '2026-10-04', 4800.00, 'NETBANKING', 'SUCCESS', 'TXN1000077'),
(78, 78, '2026-10-04', 5500.00, 'UPI', 'SUCCESS', 'TXN1000078'),
(79, 79, '2026-10-05', 6200.00, 'CARD', 'SUCCESS', 'TXN1000079'),
(80, 80, '2026-10-05', 5100.00, 'UPI', 'SUCCESS', 'TXN1000080'),

(81, 81, '2026-10-06', 5800.00, 'CARD', 'SUCCESS', 'TXN1000081'),
(82, 82, '2026-10-06', 4900.00, 'UPI', 'SUCCESS', 'TXN1000082'),
(83, 83, '2026-10-07', 5600.00, 'NETBANKING', 'SUCCESS', 'TXN1000083'),
(84, 84, '2026-10-07', 6400.00, 'CARD', 'SUCCESS', 'TXN1000084'),
(85, 85, '2026-10-08', 5300.00, 'UPI', 'SUCCESS', 'TXN1000085'),
(86, 86, '2026-10-08', 4700.00, 'CARD', 'SUCCESS', 'TXN1000086'),
(87, 87, '2026-10-09', 6100.00, 'NETBANKING', 'SUCCESS', 'TXN1000087'),
(88, 88, '2026-10-09', 5200.00, 'UPI', 'SUCCESS', 'TXN1000088'),
(89, 89, '2026-10-10', 5900.00, 'CARD', 'SUCCESS', 'TXN1000089'),
(90, 90, '2026-10-10', 5000.00, 'UPI', 'SUCCESS', 'TXN1000090'),

(91, 91, '2026-10-11', 5400.00, 'CARD', 'SUCCESS', 'TXN1000091'),
(92, 92, '2026-10-11', 6200.00, 'NETBANKING', 'SUCCESS', 'TXN1000092'),
(93, 93, '2026-10-12', 4800.00, 'UPI', 'SUCCESS', 'TXN1000093'),
(94, 94, '2026-10-12', 5700.00, 'CARD', 'SUCCESS', 'TXN1000094'),
(95, 95, '2026-10-13', 6300.00, 'UPI', 'SUCCESS', 'TXN1000095'),
(96, 96, '2026-10-13', 5100.00, 'CARD', 'SUCCESS', 'TXN1000096'),
(97, 97, '2026-10-14', 5500.00, 'NETBANKING', 'SUCCESS', 'TXN1000097'),
(98, 98, '2026-10-14', 6000.00, 'UPI', 'SUCCESS', 'TXN1000098'),
(99, 99, '2026-10-15', 5200.00, 'CARD', 'SUCCESS', 'TXN1000099'),
(100, 100, '2026-10-15', 5800.00, 'UPI', 'SUCCESS', 'TXN1000100');


SELECT COUNT(*) AS existing_payments
FROM PAYMENT
WHERE PAYMENT_ID BETWEEN 11 AND 100;

select count(*) as total_records
from payment;

select count(*) as total_records
from attendant_assignment;

-- q96. insert 90 additional records into attendant_assignment
insert into attendant_assignment
(assignment_id, attendant_id, flight_id, schedule_id, assignment_date, role, duty_hours)
values
(11,11,11,11,'2026-09-01','CABIN CREW',7.50),
(12,12,12,12,'2026-09-02','LEAD ATTENDANT',8.00),
(13,13,13,13,'2026-09-03','CABIN CREW',6.50),
(14,14,14,14,'2026-09-04','SENIOR CREW',8.25),
(15,15,15,15,'2026-09-05','CABIN CREW',7.00),
(16,16,16,16,'2026-09-06','CABIN CREW',6.75),
(17,17,17,17,'2026-09-07','LEAD ATTENDANT',8.50),
(18,18,18,18,'2026-09-08','CABIN CREW',7.25),
(19,19,19,19,'2026-09-09','SENIOR CREW',8.00),
(20,20,20,20,'2026-09-10','CABIN CREW',6.50),

(21,21,21,21,'2026-09-11','CABIN CREW',7.75),
(22,22,22,22,'2026-09-12','LEAD ATTENDANT',8.50),
(23,23,23,23,'2026-09-13','CABIN CREW',7.00),
(24,24,24,24,'2026-09-14','SENIOR CREW',8.25),
(25,25,25,25,'2026-09-15','CABIN CREW',6.75),
(26,26,26,26,'2026-09-16','CABIN CREW',7.50),
(27,27,27,27,'2026-09-17','LEAD ATTENDANT',8.00),
(28,28,28,28,'2026-09-18','CABIN CREW',7.25),
(29,29,29,29,'2026-09-19','SENIOR CREW',8.50),
(30,30,30,30,'2026-09-20','CABIN CREW',6.50),

(31,31,31,31,'2026-09-21','CABIN CREW',7.00),
(32,32,32,32,'2026-09-22','LEAD ATTENDANT',8.25),
(33,33,33,33,'2026-09-23','CABIN CREW',7.50),
(34,34,34,34,'2026-09-24','SENIOR CREW',8.00),
(35,35,35,35,'2026-09-25','CABIN CREW',6.75),
(36,36,36,36,'2026-09-26','CABIN CREW',7.25),
(37,37,37,37,'2026-09-27','LEAD ATTENDANT',8.50),
(38,38,38,38,'2026-09-28','CABIN CREW',7.00),
(39,39,39,39,'2026-09-29','SENIOR CREW',8.25),
(40,40,40,40,'2026-09-30','CABIN CREW',6.50),

(41,41,41,41,'2026-10-01','CABIN CREW',7.75),
(42,42,42,42,'2026-10-02','LEAD ATTENDANT',8.00),
(43,43,43,43,'2026-10-03','CABIN CREW',6.75),
(44,44,44,44,'2026-10-04','SENIOR CREW',8.50),
(45,45,45,45,'2026-10-05','CABIN CREW',7.25),
(46,46,46,46,'2026-10-06','CABIN CREW',7.00),
(47,47,47,47,'2026-10-07','LEAD ATTENDANT',8.25),
(48,48,48,48,'2026-10-08','CABIN CREW',6.50),
(49,49,49,49,'2026-10-09','SENIOR CREW',8.00),
(50,50,50,50,'2026-10-10','CABIN CREW',7.50),

(51,51,51,51,'2026-10-11','CABIN CREW',7.25),
(52,52,52,52,'2026-10-12','LEAD ATTENDANT',8.50),
(53,53,53,53,'2026-10-13','CABIN CREW',6.75),
(54,54,54,54,'2026-10-14','SENIOR CREW',8.25),
(55,55,55,55,'2026-10-15','CABIN CREW',7.00),
(56,56,56,56,'2026-10-16','CABIN CREW',7.75),
(57,57,57,57,'2026-10-17','LEAD ATTENDANT',8.00),
(58,58,58,58,'2026-10-18','CABIN CREW',6.50),
(59,59,59,59,'2026-10-19','SENIOR CREW',8.50),
(60,60,60,60,'2026-10-20','CABIN CREW',7.25),

(61,61,61,61,'2026-10-21','CABIN CREW',7.50),
(62,62,62,62,'2026-10-22','LEAD ATTENDANT',8.25),
(63,63,63,63,'2026-10-23','CABIN CREW',6.75),
(64,64,64,64,'2026-10-24','SENIOR CREW',8.00),
(65,65,65,65,'2026-10-25','CABIN CREW',7.00),
(66,66,66,66,'2026-10-26','CABIN CREW',7.75),
(67,67,67,67,'2026-10-27','LEAD ATTENDANT',8.50),
(68,68,68,68,'2026-10-28','CABIN CREW',6.50),
(69,69,69,69,'2026-10-29','SENIOR CREW',8.25),
(70,70,70,70,'2026-10-30','CABIN CREW',7.25),

(71,71,71,71,'2026-10-31','CABIN CREW',7.00),
(72,72,72,72,'2026-11-01','LEAD ATTENDANT',8.00),
(73,73,73,73,'2026-11-02','CABIN CREW',6.75),
(74,74,74,74,'2026-11-03','SENIOR CREW',8.50),
(75,75,75,75,'2026-11-04','CABIN CREW',7.50),
(76,76,76,76,'2026-11-05','CABIN CREW',7.25),
(77,77,77,77,'2026-11-06','LEAD ATTENDANT',8.25),
(78,78,78,78,'2026-11-07','CABIN CREW',6.50),
(79,79,79,79,'2026-11-08','SENIOR CREW',8.00),
(80,80,80,80,'2026-11-09','CABIN CREW',7.75),

(81,81,81,81,'2026-11-10','CABIN CREW',7.00),
(82,82,82,82,'2026-11-11','LEAD ATTENDANT',8.50),
(83,83,83,83,'2026-11-12','CABIN CREW',6.75),
(84,84,84,84,'2026-11-13','SENIOR CREW',8.25),
(85,85,85,85,'2026-11-14','CABIN CREW',7.50),
(86,86,86,86,'2026-11-15','CABIN CREW',7.00),
(87,87,87,87,'2026-11-16','LEAD ATTENDANT',8.00),
(88,88,88,88,'2026-11-17','CABIN CREW',6.50),
(89,89,89,89,'2026-11-18','SENIOR CREW',8.50),
(90,90,90,90,'2026-11-19','CABIN CREW',7.25),

(91,91,91,91,'2026-11-20','CABIN CREW',7.75),
(92,92,92,92,'2026-11-21','LEAD ATTENDANT',8.25),
(93,93,93,93,'2026-11-22','CABIN CREW',6.75),
(94,94,94,94,'2026-11-23','SENIOR CREW',8.00),
(95,95,95,95,'2026-11-24','CABIN CREW',7.50),
(96,96,96,96,'2026-11-25','CABIN CREW',7.00),
(97,97,97,97,'2026-11-26','LEAD ATTENDANT',8.50),
(98,98,98,98,'2026-11-27','CABIN CREW',6.50),
(99,99,99,99,'2026-11-28','SENIOR CREW',8.25),
(100,100,100,100,'2026-11-29','CABIN CREW',7.25);

select count(*) as total_records
from attendant_assignment;

show create table attendant_certification;

-- q97. insert 90 additional records into attendant_certification
insert into attendant_certification
(certification_id, attendant_id, certification_name, issue_date, expiry_date, certification_level, score)
values
(11,11,'Safety Training','2026-01-05','2028-01-05','ADVANCED',92.50),
(12,12,'First Aid','2026-01-06','2028-01-06','STANDARD',88.00),
(13,13,'Emergency Training','2026-01-07','2028-01-07','ADVANCED',94.50),
(14,14,'Cabin Safety','2026-01-08','2028-01-08','STANDARD',86.50),
(15,15,'Fire Safety','2026-01-09','2028-01-09','ADVANCED',91.00),
(16,16,'First Aid','2026-01-10','2028-01-10','STANDARD',89.50),
(17,17,'Safety Training','2026-01-11','2028-01-11','ADVANCED',95.00),
(18,18,'Cabin Safety','2026-01-12','2028-01-12','STANDARD',87.00),
(19,19,'Emergency Training','2026-01-13','2028-01-13','ADVANCED',93.50),
(20,20,'Fire Safety','2026-01-14','2028-01-14','STANDARD',85.00),

(21,21,'Safety Training','2026-01-15','2028-01-15','ADVANCED',90.50),
(22,22,'First Aid','2026-01-16','2028-01-16','STANDARD',88.50),
(23,23,'Emergency Training','2026-01-17','2028-01-17','ADVANCED',96.00),
(24,24,'Cabin Safety','2026-01-18','2028-01-18','STANDARD',84.50),
(25,25,'Fire Safety','2026-01-19','2028-01-19','ADVANCED',92.00),
(26,26,'First Aid','2026-01-20','2028-01-20','STANDARD',87.50),
(27,27,'Safety Training','2026-01-21','2028-01-21','ADVANCED',94.00),
(28,28,'Cabin Safety','2026-01-22','2028-01-22','STANDARD',86.00),
(29,29,'Emergency Training','2026-01-23','2028-01-23','ADVANCED',91.50),
(30,30,'Fire Safety','2026-01-24','2028-01-24','STANDARD',89.00),

(31,31,'Safety Training','2026-01-25','2028-01-25','ADVANCED',93.00),
(32,32,'First Aid','2026-01-26','2028-01-26','STANDARD',85.50),
(33,33,'Emergency Training','2026-01-27','2028-01-27','ADVANCED',95.50),
(34,34,'Cabin Safety','2026-01-28','2028-01-28','STANDARD',88.00),
(35,35,'Fire Safety','2026-01-29','2028-01-29','ADVANCED',90.00),
(36,36,'First Aid','2026-01-30','2028-01-30','STANDARD',86.50),
(37,37,'Safety Training','2026-02-01','2028-02-01','ADVANCED',97.00),
(38,38,'Cabin Safety','2026-02-02','2028-02-02','STANDARD',89.50),
(39,39,'Emergency Training','2026-02-03','2028-02-03','ADVANCED',92.00),
(40,40,'Fire Safety','2026-02-04','2028-02-04','STANDARD',87.00),

(41,41,'Safety Training','2026-02-05','2028-02-05','ADVANCED',94.50),
(42,42,'First Aid','2026-02-06','2028-02-06','STANDARD',88.00),
(43,43,'Emergency Training','2026-02-07','2028-02-07','ADVANCED',96.50),
(44,44,'Cabin Safety','2026-02-08','2028-02-08','STANDARD',85.00),
(45,45,'Fire Safety','2026-02-09','2028-02-09','ADVANCED',91.50),
(46,46,'First Aid','2026-02-10','2028-02-10','STANDARD',89.00),
(47,47,'Safety Training','2026-02-11','2028-02-11','ADVANCED',95.50),
(48,48,'Cabin Safety','2026-02-12','2028-02-12','STANDARD',87.50),
(49,49,'Emergency Training','2026-02-13','2028-02-13','ADVANCED',93.00),
(50,50,'Fire Safety','2026-02-14','2028-02-14','STANDARD',86.00),

(51,51,'Safety Training','2026-02-15','2028-02-15','ADVANCED',92.00),
(52,52,'First Aid','2026-02-16','2028-02-16','STANDARD',88.50),
(53,53,'Emergency Training','2026-02-17','2028-02-17','ADVANCED',94.00),
(54,54,'Cabin Safety','2026-02-18','2028-02-18','STANDARD',85.50),
(55,55,'Fire Safety','2026-02-19','2028-02-19','ADVANCED',90.50),
(56,56,'First Aid','2026-02-20','2028-02-20','STANDARD',87.00),
(57,57,'Safety Training','2026-02-21','2028-02-21','ADVANCED',96.00),
(58,58,'Cabin Safety','2026-02-22','2028-02-22','STANDARD',89.00),
(59,59,'Emergency Training','2026-02-23','2028-02-23','ADVANCED',93.50),
(60,60,'Fire Safety','2026-02-24','2028-02-24','STANDARD',86.50),

(61,61,'Safety Training','2026-02-25','2028-02-25','ADVANCED',91.00),
(62,62,'First Aid','2026-02-26','2028-02-26','STANDARD',88.00),
(63,63,'Emergency Training','2026-02-27','2028-02-27','ADVANCED',95.00),
(64,64,'Cabin Safety','2026-02-28','2028-02-28','STANDARD',84.50),
(65,65,'Fire Safety','2026-03-01','2028-03-01','ADVANCED',92.50),
(66,66,'First Aid','2026-03-02','2028-03-02','STANDARD',87.50),
(67,67,'Safety Training','2026-03-03','2028-03-03','ADVANCED',94.00),
(68,68,'Cabin Safety','2026-03-04','2028-03-04','STANDARD',89.50),
(69,69,'Emergency Training','2026-03-05','2028-03-05','ADVANCED',96.00),
(70,70,'Fire Safety','2026-03-06','2028-03-06','STANDARD',85.00),

(71,71,'Safety Training','2026-03-07','2028-03-07','ADVANCED',93.50),
(72,72,'First Aid','2026-03-08','2028-03-08','STANDARD',88.50),
(73,73,'Emergency Training','2026-03-09','2028-03-09','ADVANCED',95.50),
(74,74,'Cabin Safety','2026-03-10','2028-03-10','STANDARD',86.00),
(75,75,'Fire Safety','2026-03-11','2028-03-11','ADVANCED',91.00),
(76,76,'First Aid','2026-03-12','2028-03-12','STANDARD',87.00),
(77,77,'Safety Training','2026-03-13','2028-03-13','ADVANCED',97.00),
(78,78,'Cabin Safety','2026-03-14','2028-03-14','STANDARD',89.00),
(79,79,'Emergency Training','2026-03-15','2028-03-15','ADVANCED',92.50),
(80,80,'Fire Safety','2026-03-16','2028-03-16','STANDARD',85.50),

(81,81,'Safety Training','2026-03-17','2028-03-17','ADVANCED',94.50),
(82,82,'First Aid','2026-03-18','2028-03-18','STANDARD',88.00),
(83,83,'Emergency Training','2026-03-19','2028-03-19','ADVANCED',96.00),
(84,84,'Cabin Safety','2026-03-20','2028-03-20','STANDARD',86.50),
(85,85,'Fire Safety','2026-03-21','2028-03-21','ADVANCED',90.00),
(86,86,'First Aid','2026-03-22','2028-03-22','STANDARD',87.50),
(87,87,'Safety Training','2026-03-23','2028-03-23','ADVANCED',95.00),
(88,88,'Cabin Safety','2026-03-24','2028-03-24','STANDARD',89.50),
(89,89,'Emergency Training','2026-03-25','2028-03-25','ADVANCED',93.00),
(90,90,'Fire Safety','2026-03-26','2028-03-26','STANDARD',85.00),

(91,91,'Safety Training','2026-03-27','2028-03-27','ADVANCED',92.00),
(92,92,'First Aid','2026-03-28','2028-03-28','STANDARD',88.50),
(93,93,'Emergency Training','2026-03-29','2028-03-29','ADVANCED',94.50),
(94,94,'Cabin Safety','2026-03-30','2028-03-30','STANDARD',86.00),
(95,95,'Fire Safety','2026-03-31','2028-03-31','ADVANCED',91.50),
(96,96,'First Aid','2026-04-01','2028-04-01','STANDARD',87.00),
(97,97,'Safety Training','2026-04-02','2028-04-02','ADVANCED',96.50),
(98,98,'Cabin Safety','2026-04-03','2028-04-03','STANDARD',89.00),
(99,99,'Emergency Training','2026-04-04','2028-04-04','ADVANCED',93.50),
(100,100,'Fire Safety','2026-04-05','2028-04-05','STANDARD',85.50);



select count(*) as total_records
from attendant_certification;

show create table crew_training;

-- q98. insert 90 additional records into crew_training
insert into crew_training
(training_id, attendant_id, training_name, training_date, training_type, score, training_status)
values
(11,11,'Safety Training','2026-01-05','SAFETY',92.50,'COMPLETED'),
(12,12,'First Aid Training','2026-01-06','MEDICAL',88.00,'COMPLETED'),
(13,13,'Emergency Training','2026-01-07','EMERGENCY',94.50,'COMPLETED'),
(14,14,'Cabin Safety Training','2026-01-08','SAFETY',86.50,'COMPLETED'),
(15,15,'Fire Safety Training','2026-01-09','SAFETY',91.00,'COMPLETED'),
(16,16,'First Aid Training','2026-01-10','MEDICAL',89.50,'COMPLETED'),
(17,17,'Emergency Training','2026-01-11','EMERGENCY',95.00,'COMPLETED'),
(18,18,'Cabin Safety Training','2026-01-12','SAFETY',87.00,'COMPLETED'),
(19,19,'Fire Safety Training','2026-01-13','SAFETY',93.50,'COMPLETED'),
(20,20,'First Aid Training','2026-01-14','MEDICAL',85.00,'COMPLETED'),

(21,21,'Safety Training','2026-01-15','SAFETY',90.50,'COMPLETED'),
(22,22,'Emergency Training','2026-01-16','EMERGENCY',88.50,'COMPLETED'),
(23,23,'First Aid Training','2026-01-17','MEDICAL',96.00,'COMPLETED'),
(24,24,'Cabin Safety Training','2026-01-18','SAFETY',84.50,'COMPLETED'),
(25,25,'Fire Safety Training','2026-01-19','SAFETY',92.00,'COMPLETED'),
(26,26,'First Aid Training','2026-01-20','MEDICAL',87.50,'COMPLETED'),
(27,27,'Emergency Training','2026-01-21','EMERGENCY',94.00,'COMPLETED'),
(28,28,'Cabin Safety Training','2026-01-22','SAFETY',86.00,'COMPLETED'),
(29,29,'Fire Safety Training','2026-01-23','SAFETY',91.50,'COMPLETED'),
(30,30,'First Aid Training','2026-01-24','MEDICAL',89.00,'COMPLETED'),

(31,31,'Safety Training','2026-01-25','SAFETY',93.00,'COMPLETED'),
(32,32,'Emergency Training','2026-01-26','EMERGENCY',85.50,'COMPLETED'),
(33,33,'First Aid Training','2026-01-27','MEDICAL',95.50,'COMPLETED'),
(34,34,'Cabin Safety Training','2026-01-28','SAFETY',88.00,'COMPLETED'),
(35,35,'Fire Safety Training','2026-01-29','SAFETY',90.00,'COMPLETED'),
(36,36,'First Aid Training','2026-01-30','MEDICAL',86.50,'COMPLETED'),
(37,37,'Emergency Training','2026-02-01','EMERGENCY',97.00,'COMPLETED'),
(38,38,'Cabin Safety Training','2026-02-02','SAFETY',89.50,'COMPLETED'),
(39,39,'Fire Safety Training','2026-02-03','SAFETY',92.00,'COMPLETED'),
(40,40,'First Aid Training','2026-02-04','MEDICAL',87.00,'COMPLETED'),

(41,41,'Safety Training','2026-02-05','SAFETY',94.50,'COMPLETED'),
(42,42,'Emergency Training','2026-02-06','EMERGENCY',88.00,'COMPLETED'),
(43,43,'First Aid Training','2026-02-07','MEDICAL',96.50,'COMPLETED'),
(44,44,'Cabin Safety Training','2026-02-08','SAFETY',85.00,'COMPLETED'),
(45,45,'Fire Safety Training','2026-02-09','SAFETY',91.50,'COMPLETED'),
(46,46,'First Aid Training','2026-02-10','MEDICAL',89.00,'COMPLETED'),
(47,47,'Emergency Training','2026-02-11','EMERGENCY',95.50,'COMPLETED'),
(48,48,'Cabin Safety Training','2026-02-12','SAFETY',87.50,'COMPLETED'),
(49,49,'Fire Safety Training','2026-02-13','SAFETY',93.00,'COMPLETED'),
(50,50,'First Aid Training','2026-02-14','MEDICAL',86.00,'COMPLETED'),

(51,51,'Safety Training','2026-02-15','SAFETY',92.00,'COMPLETED'),
(52,52,'Emergency Training','2026-02-16','EMERGENCY',88.50,'COMPLETED'),
(53,53,'First Aid Training','2026-02-17','MEDICAL',94.00,'COMPLETED'),
(54,54,'Cabin Safety Training','2026-02-18','SAFETY',85.50,'COMPLETED'),
(55,55,'Fire Safety Training','2026-02-19','SAFETY',90.50,'COMPLETED'),
(56,56,'First Aid Training','2026-02-20','MEDICAL',87.00,'COMPLETED'),
(57,57,'Emergency Training','2026-02-21','EMERGENCY',96.00,'COMPLETED'),
(58,58,'Cabin Safety Training','2026-02-22','SAFETY',89.00,'COMPLETED'),
(59,59,'Fire Safety Training','2026-02-23','SAFETY',93.50,'COMPLETED'),
(60,60,'First Aid Training','2026-02-24','MEDICAL',86.50,'COMPLETED'),

(61,61,'Safety Training','2026-02-25','SAFETY',91.00,'COMPLETED'),
(62,62,'Emergency Training','2026-02-26','EMERGENCY',88.00,'COMPLETED'),
(63,63,'First Aid Training','2026-02-27','MEDICAL',95.00,'COMPLETED'),
(64,64,'Cabin Safety Training','2026-02-28','SAFETY',84.50,'COMPLETED'),
(65,65,'Fire Safety Training','2026-03-01','SAFETY',92.50,'COMPLETED'),
(66,66,'First Aid Training','2026-03-02','MEDICAL',87.50,'COMPLETED'),
(67,67,'Emergency Training','2026-03-03','EMERGENCY',94.00,'COMPLETED'),
(68,68,'Cabin Safety Training','2026-03-04','SAFETY',89.50,'COMPLETED'),
(69,69,'Fire Safety Training','2026-03-05','SAFETY',96.00,'COMPLETED'),
(70,70,'First Aid Training','2026-03-06','MEDICAL',85.00,'COMPLETED'),

(71,71,'Safety Training','2026-03-07','SAFETY',93.50,'COMPLETED'),
(72,72,'Emergency Training','2026-03-08','EMERGENCY',88.50,'COMPLETED'),
(73,73,'First Aid Training','2026-03-09','MEDICAL',95.50,'COMPLETED'),
(74,74,'Cabin Safety Training','2026-03-10','SAFETY',86.00,'COMPLETED'),
(75,75,'Fire Safety Training','2026-03-11','SAFETY',91.00,'COMPLETED'),
(76,76,'First Aid Training','2026-03-12','MEDICAL',87.00,'COMPLETED'),
(77,77,'Emergency Training','2026-03-13','EMERGENCY',97.00,'COMPLETED'),
(78,78,'Cabin Safety Training','2026-03-14','SAFETY',89.00,'COMPLETED'),
(79,79,'Fire Safety Training','2026-03-15','SAFETY',92.50,'COMPLETED'),
(80,80,'First Aid Training','2026-03-16','MEDICAL',85.50,'COMPLETED'),

(81,81,'Safety Training','2026-03-17','SAFETY',94.50,'COMPLETED'),
(82,82,'Emergency Training','2026-03-18','EMERGENCY',88.00,'COMPLETED'),
(83,83,'First Aid Training','2026-03-19','MEDICAL',96.00,'COMPLETED'),
(84,84,'Cabin Safety Training','2026-03-20','SAFETY',86.50,'COMPLETED'),
(85,85,'Fire Safety Training','2026-03-21','SAFETY',90.00,'COMPLETED'),
(86,86,'First Aid Training','2026-03-22','MEDICAL',87.50,'COMPLETED'),
(87,87,'Emergency Training','2026-03-23','EMERGENCY',95.00,'COMPLETED'),
(88,88,'Cabin Safety Training','2026-03-24','SAFETY',89.50,'COMPLETED'),
(89,89,'Fire Safety Training','2026-03-25','SAFETY',93.00,'COMPLETED'),
(90,90,'First Aid Training','2026-03-26','MEDICAL',85.00,'COMPLETED'),

(91,91,'Safety Training','2026-03-27','SAFETY',92.00,'COMPLETED'),
(92,92,'Emergency Training','2026-03-28','EMERGENCY',88.50,'COMPLETED'),
(93,93,'First Aid Training','2026-03-29','MEDICAL',94.50,'COMPLETED'),
(94,94,'Cabin Safety Training','2026-03-30','SAFETY',86.00,'COMPLETED'),
(95,95,'Fire Safety Training','2026-03-31','SAFETY',91.50,'COMPLETED'),
(96,96,'First Aid Training','2026-04-01','MEDICAL',87.00,'COMPLETED'),
(97,97,'Emergency Training','2026-04-02','EMERGENCY',96.50,'COMPLETED'),
(98,98,'Cabin Safety Training','2026-04-03','SAFETY',89.00,'COMPLETED'),
(99,99,'Fire Safety Training','2026-04-04','SAFETY',93.50,'COMPLETED'),
(100,100,'First Aid Training','2026-04-05','MEDICAL',85.50,'COMPLETED');

select count(*) as total_records
from crew_training;

show create table flight_incident;

-- q99. insert 90 additional records into flight_incident
INSERT INTO FLIGHT_INCIDENT
(INCIDENT_ID, FLIGHT_ID, ATTENDANT_ID, INCIDENT_DATE, INCIDENT_TYPE, SEVERITY, DESCRIPTION, STATUS)
VALUES
(11,11,11,'2026-01-05','TURBULENCE','LOW','Minor turbulence reported during flight','CLOSED'),
(12,12,12,'2026-01-06','MEDICAL EMERGENCY','HIGH','Passenger required immediate medical assistance','CLOSED'),
(13,13,13,'2026-01-07','DELAY','MEDIUM','Flight delayed due to operational issue','CLOSED'),
(14,14,14,'2026-01-08','BAGGAGE ISSUE','LOW','Passenger baggage was delayed','CLOSED'),
(15,15,15,'2026-01-09','TURBULENCE','MEDIUM','Moderate turbulence experienced during flight','CLOSED'),
(16,16,16,'2026-01-10','PASSENGER COMPLAINT','LOW','Passenger reported service issue','CLOSED'),
(17,17,17,'2026-01-11','MEDICAL EMERGENCY','HIGH','Medical assistance provided to passenger','CLOSED'),
(18,18,18,'2026-01-12','TECHNICAL ISSUE','MEDIUM','Minor technical issue detected','CLOSED'),
(19,19,19,'2026-01-13','TURBULENCE','LOW','Light turbulence reported','CLOSED'),
(20,20,20,'2026-01-14','SECURITY ISSUE','HIGH','Security concern reported onboard','CLOSED'),

(21,21,21,'2026-01-15','DELAY','MEDIUM','Flight departure was delayed','CLOSED'),
(22,22,22,'2026-01-16','BAGGAGE ISSUE','LOW','Baggage handling issue reported','CLOSED'),
(23,23,23,'2026-01-17','TURBULENCE','MEDIUM','Moderate turbulence reported','CLOSED'),
(24,24,24,'2026-01-18','MEDICAL EMERGENCY','HIGH','Passenger required medical attention','CLOSED'),
(25,25,25,'2026-01-19','PASSENGER COMPLAINT','LOW','Passenger reported inconvenience','CLOSED'),
(26,26,26,'2026-01-20','TECHNICAL ISSUE','MEDIUM','Minor equipment issue reported','CLOSED'),
(27,27,27,'2026-01-21','TURBULENCE','LOW','Light turbulence during flight','CLOSED'),
(28,28,28,'2026-01-22','DELAY','MEDIUM','Flight delayed due to weather','CLOSED'),
(29,29,29,'2026-01-23','SECURITY ISSUE','HIGH','Security concern investigated','CLOSED'),
(30,30,30,'2026-01-24','BAGGAGE ISSUE','LOW','Baggage delivery was delayed','CLOSED'),

(31,31,31,'2026-01-25','MEDICAL EMERGENCY','HIGH','Passenger received medical assistance','CLOSED'),
(32,32,32,'2026-01-26','TURBULENCE','MEDIUM','Moderate turbulence reported','CLOSED'),
(33,33,33,'2026-01-27','DELAY','LOW','Short operational delay occurred','CLOSED'),
(34,34,34,'2026-01-28','TECHNICAL ISSUE','MEDIUM','Technical issue identified before departure','CLOSED'),
(35,35,35,'2026-01-29','PASSENGER COMPLAINT','LOW','Complaint regarding onboard service','CLOSED'),
(36,36,36,'2026-01-30','TURBULENCE','LOW','Light turbulence reported','CLOSED'),
(37,37,37,'2026-02-01','SECURITY ISSUE','HIGH','Security concern reported onboard','CLOSED'),
(38,38,38,'2026-02-02','BAGGAGE ISSUE','LOW','Baggage handling problem reported','CLOSED'),
(39,39,39,'2026-02-03','MEDICAL EMERGENCY','HIGH','Passenger required medical assistance','CLOSED'),
(40,40,40,'2026-02-04','DELAY','MEDIUM','Departure delayed due to operational issue','CLOSED'),

(41,41,41,'2026-02-05','TURBULENCE','MEDIUM','Moderate turbulence experienced','CLOSED'),
(42,42,42,'2026-02-06','TECHNICAL ISSUE','LOW','Minor technical problem reported','CLOSED'),
(43,43,43,'2026-02-07','PASSENGER COMPLAINT','LOW','Passenger service complaint received','CLOSED'),
(44,44,44,'2026-02-08','MEDICAL EMERGENCY','HIGH','Medical assistance provided','CLOSED'),
(45,45,45,'2026-02-09','BAGGAGE ISSUE','LOW','Passenger baggage was delayed','CLOSED'),
(46,46,46,'2026-02-10','TURBULENCE','MEDIUM','Moderate turbulence reported','CLOSED'),
(47,47,47,'2026-02-11','DELAY','MEDIUM','Flight experienced operational delay','CLOSED'),
(48,48,48,'2026-02-12','SECURITY ISSUE','HIGH','Security issue investigated','CLOSED'),
(49,49,49,'2026-02-13','TECHNICAL ISSUE','MEDIUM','Aircraft technical issue reported','CLOSED'),
(50,50,50,'2026-02-14','TURBULENCE','LOW','Light turbulence reported','CLOSED'),

(51,51,51,'2026-02-15','MEDICAL EMERGENCY','HIGH','Passenger required medical assistance','CLOSED'),
(52,52,52,'2026-02-16','BAGGAGE ISSUE','LOW','Baggage delivery was delayed','CLOSED'),
(53,53,53,'2026-02-17','DELAY','MEDIUM','Flight departure was delayed','CLOSED'),
(54,54,54,'2026-02-18','TURBULENCE','LOW','Minor turbulence reported','CLOSED'),
(55,55,55,'2026-02-19','PASSENGER COMPLAINT','LOW','Passenger reported service issue','CLOSED'),
(56,56,56,'2026-02-20','TECHNICAL ISSUE','MEDIUM','Technical problem detected','CLOSED'),
(57,57,57,'2026-02-21','SECURITY ISSUE','HIGH','Security concern reported','CLOSED'),
(58,58,58,'2026-02-22','MEDICAL EMERGENCY','HIGH','Medical assistance provided','CLOSED'),
(59,59,59,'2026-02-23','TURBULENCE','MEDIUM','Moderate turbulence reported','CLOSED'),
(60,60,60,'2026-02-24','DELAY','LOW','Short flight delay reported','CLOSED'),

(61,61,61,'2026-02-25','BAGGAGE ISSUE','LOW','Baggage handling issue occurred','CLOSED'),
(62,62,62,'2026-02-26','TURBULENCE','MEDIUM','Moderate turbulence experienced','CLOSED'),
(63,63,63,'2026-02-27','MEDICAL EMERGENCY','HIGH','Passenger required medical attention','CLOSED'),
(64,64,64,'2026-02-28','TECHNICAL ISSUE','MEDIUM','Minor technical issue detected','CLOSED'),
(65,65,65,'2026-03-01','PASSENGER COMPLAINT','LOW','Passenger submitted a complaint','CLOSED'),
(66,66,66,'2026-03-02','DELAY','MEDIUM','Flight delayed due to operational reasons','CLOSED'),
(67,67,67,'2026-03-03','SECURITY ISSUE','HIGH','Security concern investigated','CLOSED'),
(68,68,68,'2026-03-04','TURBULENCE','LOW','Light turbulence reported','CLOSED'),
(69,69,69,'2026-03-05','BAGGAGE ISSUE','LOW','Baggage handling issue reported','CLOSED'),
(70,70,70,'2026-03-06','MEDICAL EMERGENCY','HIGH','Passenger received medical assistance','CLOSED'),

(71,71,71,'2026-03-07','TECHNICAL ISSUE','MEDIUM','Technical issue reported during inspection','CLOSED'),
(72,72,72,'2026-03-08','TURBULENCE','MEDIUM','Moderate turbulence reported','CLOSED'),
(73,73,73,'2026-03-09','DELAY','LOW','Short delay reported','CLOSED'),
(74,74,74,'2026-03-10','PASSENGER COMPLAINT','LOW','Passenger complained about service','CLOSED'),
(75,75,75,'2026-03-11','SECURITY ISSUE','HIGH','Security concern reported','CLOSED'),
(76,76,76,'2026-03-12','BAGGAGE ISSUE','LOW','Baggage delivery delayed','CLOSED'),
(77,77,77,'2026-03-13','MEDICAL EMERGENCY','HIGH','Medical assistance provided','CLOSED'),
(78,78,78,'2026-03-14','TURBULENCE','MEDIUM','Moderate turbulence experienced','CLOSED'),
(79,79,79,'2026-03-15','TECHNICAL ISSUE','MEDIUM','Technical problem reported','CLOSED'),
(80,80,80,'2026-03-16','DELAY','LOW','Operational delay occurred','CLOSED'),

(81,81,81,'2026-03-17','TURBULENCE','LOW','Light turbulence reported','CLOSED'),
(82,82,82,'2026-03-18','MEDICAL EMERGENCY','HIGH','Passenger required medical attention','CLOSED'),
(83,83,83,'2026-03-19','BAGGAGE ISSUE','LOW','Baggage handling problem reported','CLOSED'),
(84,84,84,'2026-03-20','PASSENGER COMPLAINT','LOW','Passenger service complaint received','CLOSED'),
(85,85,85,'2026-03-21','DELAY','MEDIUM','Flight departure delayed','CLOSED'),
(86,86,86,'2026-03-22','TECHNICAL ISSUE','MEDIUM','Technical issue detected','CLOSED'),
(87,87,87,'2026-03-23','SECURITY ISSUE','HIGH','Security concern investigated','CLOSED'),
(88,88,88,'2026-03-24','TURBULENCE','MEDIUM','Moderate turbulence reported','CLOSED'),
(89,89,89,'2026-03-25','MEDICAL EMERGENCY','HIGH','Medical assistance provided','CLOSED'),
(90,90,90,'2026-03-26','BAGGAGE ISSUE','LOW','Baggage was delayed','CLOSED'),

(91,91,91,'2026-03-27','DELAY','MEDIUM','Flight delayed due to operational issue','CLOSED'),
(92,92,92,'2026-03-28','TURBULENCE','LOW','Light turbulence reported','CLOSED'),
(93,93,93,'2026-03-29','TECHNICAL ISSUE','MEDIUM','Minor technical problem reported','CLOSED'),
(94,94,94,'2026-03-30','PASSENGER COMPLAINT','LOW','Passenger reported service issue','CLOSED'),
(95,95,95,'2026-03-31','SECURITY ISSUE','HIGH','Security concern reported','CLOSED'),
(96,96,96,'2026-04-01','MEDICAL EMERGENCY','HIGH','Passenger required medical assistance','CLOSED'),
(97,97,97,'2026-04-02','TURBULENCE','MEDIUM','Moderate turbulence reported','CLOSED'),
(98,98,98,'2026-04-03','BAGGAGE ISSUE','LOW','Baggage handling issue reported','CLOSED'),
(99,99,99,'2026-04-04','DELAY','LOW','Short operational delay occurred','CLOSED'),
(100,100,100,'2026-04-05','TECHNICAL ISSUE','MEDIUM','Technical issue detected','CLOSED');


