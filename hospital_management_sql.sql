CREATE DATABASE HOSPITAL_MANAGEMENT;
USE HOSPITAL_MANAGEMENT;

CREATE TABLE Patients(
Patient_ID INT PRIMARY KEY,
Patient_Name VARCHAR(100),
Gender VARCHAR(50),
Date_of_Birth DATE,	
AGE	INT,
AGE_GROUP VARCHAR(100),
City VARCHAR(100),
Blood_Group	VARCHAR(50),
Registration_Date DATE						
);
DESCRIBE Patients;
DROP TABLE IF EXISTS hospital_management.patients;
SELECT * FROM hospital_management.patients;
SELECT COUNT(*)FROM Patients;

CREATE TABLE Appointments (
    Appointment_ID INT PRIMARY KEY,
    Patient_ID INT,
    Appointment_Date DATE,
    Department VARCHAR(50),
    Doctor_Name VARCHAR(100),
    Appointment_Type VARCHAR(50),
    Appointment_Status VARCHAR(30),
    Payment_Method VARCHAR(30),
    Bill_Amount DECIMAL(12,2)
);
DESCRIBE Appointments;
SELECT * FROM Appointments;
SELECT COUNT(*) FROM Appointments;

SHOW tables;
SELECT COUNT(*) AS Total_Patients
FROM Patients;
SELECT AVG(AGE) AS AVERAGE_AGE
FROM Patients;
SELECT MIN(AGE) AS YOUNGEST_AGE
FROM Patients;
SELECT MAX(AGE) AS OLDEST_AGE
FROM Patients;
SELECT DISTINCT Blood_Group
FROM Patients;
SELECT Gender, COUNT(*) AS PATIENTS_COUNT
FROM Patients
GROUP BY Gender;
SELECT COUNT(*) AS Patients_60_Plus
FROM Patients
WHERE AGE >= 60;
SELECT City,COUNT(*) AS PATIENTS_COUNT
FROM Patients
GROUP BY City
ORDER BY PATIENTS_COUNT DESC;
SELECT City,COUNT(*) AS PATIENTS_COUNT
FROM Patients
GROUP BY City
HAVING COUNT(*)>150
ORDER BY PATIENTS_COUNT DESC;

SELECT COUNT(*) AS TOTAL_APPOINTMENTS
FROM Appointments;
SELECT SUM(Bill_Amount) AS TOTAL_BILL_AMOUNT
FROM Appointments;
SELECT AVG(Bill_Amount) AS TOTAL_BILL_AMOUNT
FROM Appointments;
SELECT COUNT(*) , Appointment_Status AS APPOINTMENT_COUNT
FROM Appointments
GROUP BY Appointment_Status
ORDER BY APPOINTMENT_COUNT;
SELECT COUNT(*),Department AS APPOINTMENT_COUNT_PER_DEPT
FROM Appointments
GROUP BY Department
ORDER BY APPOINTMENT_COUNT_PER_DEPT DESC;
SELECT Appointment_Type, SUM(Bill_Amount) AS Total_Bill
FROM Appointments
GROUP BY Appointment_Type
ORDER BY Total_Bill DESC;

SELECT 
Patients.Patient_Name,
Appointments.Appointment_ID,
Appointments.Doctor_Name
FROM Patients
JOIN Appointments
ON Patients.Patient_ID=Appointments.Patient_ID;

SELECT 
Patients.Patient_Name, COUNT(Appointments.Appointment_ID) AS Total_Appointments
FROM Patients
JOIN Appointments
ON Patients.Patient_ID = Appointments.Patient_ID
GROUP BY Patients.Patient_ID, Patients.Patient_Name
ORDER BY Total_Appointments DESC;

SELECT 
Patients.City, SUM(Bill_Amount) AS TOTAL_BILL
FROM Patients
JOIN Appointments
ON Patients.Patient_ID=Appointments.Patient_ID
GROUP BY Patients.City
ORDER BY TOTAL_BILL DESC;

SELECT Patient_Name, AGE
FROM Patients
WHERE AGE > (
SELECT AVG(AGE)
FROM Patients
);

SELECT Patient_Name
FROM Patients
WHERE Patient_ID IN (
SELECT Patient_ID
FROM Appointments
WHERE Bill_Amount > (
SELECT AVG(Bill_Amount)
FROM Appointments)
);

SELECT Department,SUM(Bill_Amount) AS Total_Bill
FROM Appointments
GROUP BY Department
HAVING SUM(Bill_Amount) > 2000000
ORDER BY Total_Bill DESC;



