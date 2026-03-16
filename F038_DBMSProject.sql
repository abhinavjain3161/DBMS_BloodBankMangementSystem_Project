CREATE DATABASE BloodBankManagementSystem;
USE BloodBankManagementSystem;
CREATE TABLE Donor(
Donor_ID INT PRIMARY KEY,
Name VARCHAR(50),
Age INT,
Gender VARCHAR(10),
Blood_Group VARCHAR(5),
Contact_Number VARCHAR(15),
Address VARCHAR(100)
);
CREATE TABLE Blood_Bank(
Bank_ID INT PRIMARY KEY,
Bank_Name VARCHAR(50),
Location VARCHAR(50),
Contact_Number VARCHAR(15)
);
CREATE TABLE Blood(
Blood_ID INT PRIMARY KEY,
Blood_Group VARCHAR(5),
Quantity INT,
Expiry_Date DATE,
Bank_ID INT,
FOREIGN KEY (Bank_ID) REFERENCES Blood_Bank(Bank_ID)
);
INSERT INTO Donor VALUES
(1,'Rahul Sharma',25,'Male','A+','9876543210','Delhi'),
(2,'Amit Verma',30,'Male','O+','9876543211','Mumbai'),
(3,'Neha Singh',22,'Female','B+','9876543212','Pune');


INSERT INTO Blood_Bank VALUES
(1,'City Blood Bank','Delhi','0112345678'),
(2,'LifeCare Blood Bank','Mumbai','0222345678'),
(3,'Red Cross Blood Bank','Pune','0202345678'),
(4,'Hope Blood Bank','Ahmedabad','0792345678'),
(5,'Central Blood Bank','Bhopal','07552345678');

INSERT INTO Blood VALUES
(1,'A+',10,'2026-01-10',1),
(2,'O+',15,'2026-02-15',2),
(3,'B+',8,'2026-01-20',3),
(4,'AB+',5,'2026-03-10',1),
(5,'O-',6,'2026-01-30',2),
(6,'A-',7,'2026-02-25',3),
(7,'B-',4,'2026-03-05',4),
(8,'AB-',3,'2026-01-18',5),
(9,'O+',12,'2026-02-28',1),
(10,'A+',9,'2026-03-15',5);

INSERT INTO Patient VALUES
(1,'Arjun Kumar','A+','AIIMS Delhi','9876500001'),
(2,'Meera Joshi','O+','Apollo Hospital','9876500002'),
(3,'Ravi Singh','B+','Fortis Hospital','9876500003'),
(4,'Anita Shah','AB+','City Hospital','9876500004'),
(5,'Sanjay Gupta','O-','Medanta Hospital','9876500005'),
(6,'Ritu Sharma','A-','Care Hospital','9876500006'),
(7,'Manoj Patel','B-','Global Hospital','9876500007'),
(8,'Kavita Jain','AB-','Max Hospital','9876500008'),
(9,'Deepak Yadav','O+','Sunrise Hospital','9876500009'),
(10,'Nisha Verma','A+','Metro Hospital','9876500010');
















DROP DATABASE bloodbankmanagementsystem;

CREATE DATABASE BloodBankDB;
USE BloodBankDB;

CREATE TABLE Donor(
donor_id INT PRIMARY KEY,
name VARCHAR(50),
gender VARCHAR(10),
age INT,
blood_group VARCHAR(5),
phone VARCHAR(15),
address VARCHAR(100)
);
CREATE TABLE Blood_Bank(
bank_id INT PRIMARY KEY,
name VARCHAR(50),
location VARCHAR(50),
contact_no VARCHAR(15)
);
CREATE TABLE Staff(
staff_id INT PRIMARY KEY,
name VARCHAR(50),
role VARCHAR(30),
salary INT,
bank_id INT,
FOREIGN KEY(bank_id) REFERENCES Blood_Bank(bank_id)
);
CREATE TABLE Blood_Unit(
unitNo INT PRIMARY KEY,
bloodGroup VARCHAR(5),
volume INT,
collectionDate DATE,
expiryDate DATE,
donor_id INT,
bank_id INT,
FOREIGN KEY(donor_id) REFERENCES Donor(donor_id),
FOREIGN KEY(bank_id) REFERENCES Blood_Bank(bank_id)
);
CREATE TABLE Recipient(
recipient_id INT PRIMARY KEY,
name VARCHAR(50),
blood_group VARCHAR(5),
hospital_name VARCHAR(50),
phone VARCHAR(15)
);
CREATE TABLE Receives(
recipient_id INT,
unitNo INT,
issue_date DATE,
PRIMARY KEY(recipient_id, unitNo),
FOREIGN KEY(recipient_id) REFERENCES Recipient(recipient_id),
FOREIGN KEY(unitNo) REFERENCES Blood_Unit(unitNo)
);

INSERT INTO Donor VALUES
(1,'Rahul Sharma','Male',25,'A+','9876543210','Delhi'),
(2,'Amit Verma','Male',30,'O+','9876543211','Mumbai'),
(3,'Neha Singh','Female',22,'B+','9876543212','Pune'),
(4,'Priya Patel','Female',28,'AB+','9876543213','Ahmedabad'),
(5,'Rohan Mehta','Male',35,'O-','9876543214','Jaipur'),
(6,'Ankit Jain','Male',27,'A-','9876543215','Indore'),
(7,'Sneha Kapoor','Female',24,'B-','9876543216','Delhi'),
(8,'Vikas Yadav','Male',31,'O+','9876543217','Lucknow'),
(9,'Pooja Sharma','Female',26,'A+','9876543218','Chandigarh'),
(10,'Karan Gupta','Male',29,'AB-','9876543219','Bhopal');

INSERT INTO Blood_Bank VALUES
(1,'City Blood Bank','Delhi','0112345678'),
(2,'LifeCare Blood Bank','Mumbai','0222345678'),
(3,'Red Cross Blood Bank','Pune','0202345678');

INSERT INTO Staff VALUES
(1,'Suresh Kumar','Manager',50000,1),
(2,'Anita Singh','Technician',35000,1),
(3,'Rakesh Patel','Nurse',30000,2),
(4,'Sunita Shah','Manager',52000,2),
(5,'Arun Jain','Technician',34000,3);

INSERT INTO Blood_Unit VALUES
(101,'A+',450,'2026-01-10','2026-03-10',1,1),
(102,'O+',450,'2026-01-12','2026-03-12',2,1),
(103,'B+',450,'2026-01-15','2026-03-15',3,2),
(104,'AB+',450,'2026-01-18','2026-03-18',4,2),
(105,'O-',450,'2026-01-20','2026-03-20',5,3),
(106,'A-',450,'2026-01-22','2026-03-22',6,3),
(107,'B-',450,'2026-01-25','2026-03-25',7,1),
(108,'O+',450,'2026-01-28','2026-03-28',8,2),
(109,'A+',450,'2026-02-01','2026-04-01',9,3),
(110,'AB-',450,'2026-02-03','2026-04-03',10,1);

INSERT INTO Recipient VALUES
(1,'Arjun Kumar','A+','AIIMS Delhi','9876500001'),
(2,'Meera Joshi','O+','Apollo Hospital','9876500002'),
(3,'Ravi Singh','B+','Fortis Hospital','9876500003'),
(4,'Anita Shah','AB+','City Hospital','9876500004'),
(5,'Sanjay Gupta','O-','Medanta Hospital','9876500005');

INSERT INTO Receives VALUES
(1,101,'2026-03-01'),
(2,102,'2026-03-02'),
(3,103,'2026-03-03'),
(4,104,'2026-03-04'),
(5,105,'2026-03-05');

SELECT * FROM Donor;

SELECT * FROM Blood_Unit;

SELECT name FROM Donor WHERE blood_group='O+';

SELECT COUNT(*) FROM Donor;

SELECT bank_id, COUNT(*) FROM Blood_Unit
GROUP BY bank_id;

SELECT Staff.name, Blood_Bank.name
FROM Staff
JOIN Blood_Bank
ON Staff.bank_id = Blood_Bank.bank_id;

SELECT Donor.name, Blood_Unit.unitNo
FROM Donor
JOIN Blood_Unit
ON Donor.donor_id = Blood_Unit.donor_id;

SELECT Recipient.name, Receives.issue_date
FROM Recipient
JOIN Receives
ON Recipient.recipient_id = Receives.recipient_id;

SELECT * FROM Blood_Unit
WHERE expiryDate < '2026-04-01';

SELECT * FROM Staff
WHERE salary > 40000;

SELECT * FROM Donor
ORDER BY age DESC;

UPDATE Staff
SET salary = salary + 5000
WHERE role='Technician';

DELETE FROM Blood_Unit
WHERE expiryDate < '2026-02-01';

SELECT bloodGroup, COUNT(*)
FROM Blood_Unit
GROUP BY bloodGroup;

SELECT unitNo
FROM Blood_Unit
WHERE bank_id = 1;

SELECT name FROM Donor
WHERE age < 30;

SELECT name, hospital_name
FROM Recipient;

SELECT name, blood_group
FROM Recipient;

SELECT Blood_Unit.unitNo, Donor.name
FROM Blood_Unit
JOIN Donor
ON Blood_Unit.donor_id = Donor.donor_id;

SELECT bank_id, COUNT(*)
FROM Staff
GROUP BY bank_id;

SELECT COUNT(*) AS Total_Donors
FROM Donor;

SELECT * FROM Staff
WHERE salary > 40000;

SELECT bank_id, COUNT(*) AS Total_Units
FROM Blood_Unit
GROUP BY bank_id;

SELECT Donor.name, Blood_Unit.unitNo
FROM Donor
JOIN Blood_Unit
ON Donor.donor_id = Blood_Unit.donor_id;

SELECT Recipient.name, Receives.issue_date
FROM Recipient
JOIN Receives
ON Recipient.recipient_id = Receives.recipient_id;

SELECT * FROM Blood_Unit
WHERE expiryDate < '2026-04-01';

SELECT * FROM Donor
ORDER BY age DESC;

SELECT bloodGroup, COUNT(*)
FROM Blood_Unit
GROUP BY bloodGroup;

SELECT * FROM Blood_Unit;

SELECT Donor.name, Donor.blood_group, Blood_Unit.unitNo
FROM Donor
INNER JOIN Blood_Unit
ON Donor.donor_id = Blood_Unit.donor_id;

SELECT Recipient.name, Blood_Unit.bloodGroup, Receives.issue_date
FROM Recipient
INNER JOIN Receives
ON Recipient.recipient_id = Receives.recipient_id
INNER JOIN Blood_Unit
ON Receives.unitNo = Blood_Unit.unitNo;


SELECT Donor.name, Blood_Unit.unitNo
FROM Donor
LEFT JOIN Blood_Unit
ON Donor.donor_id = Blood_Unit.donor_id;

SELECT Donor.name, Blood_Unit.unitNo, Blood_Unit.bloodGroup
FROM Donor
RIGHT JOIN Blood_Unit
ON Donor.donor_id = Blood_Unit.donor_id;

SELECT Blood_Bank.name AS BloodBank, Staff.name AS Staff_Name
FROM Blood_Bank
LEFT JOIN Staff
ON Blood_Bank.bank_id = Staff.bank_id;

SELECT Donor.name, Blood_Unit.unitNo, Blood_Bank.name
FROM Donor
INNER JOIN Blood_Unit
ON Donor.donor_id = Blood_Unit.donor_id
INNER JOIN Blood_Bank
ON Blood_Unit.bank_id = Blood_Bank.bank_id;

SELECT Recipient.name, Receives.unitNo
FROM Recipient
LEFT JOIN Receives
ON Recipient.recipient_id = Receives.recipient_id;

SELECT Staff.name, Blood_Bank.name
FROM Staff
RIGHT JOIN Blood_Bank
ON Staff.bank_id = Blood_Bank.bank_id;

SELECT d1.name AS Donor1, d2.name AS Donor2, d1.blood_group
FROM Donor d1
JOIN Donor d2
ON d1.blood_group = d2.blood_group
AND d1.donor_id <> d2.donor_id;

SELECT Donor.name, Blood_Unit.unitNo
FROM Donor
LEFT JOIN Blood_Unit
ON Donor.donor_id = Blood_Unit.donor_id

UNION

SELECT Donor.name, Blood_Unit.unitNo
FROM Donor
RIGHT JOIN Blood_Unit
ON Donor.donor_id = Blood_Unit.donor_id;

