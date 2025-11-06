-- Table structure for table `books`
--

CREATE TABLE `books` (
  `Book_ID` bigint(20) UNSIGNED NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Author` varchar(100) DEFAULT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `Published_Year` int(11) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- 
-- 1. Total Number of Patients
-- Find the total number of patients across all hospitals.
-- Answer:-

SELECT SUM(Patients_count) AS Total_Number_of_Patients FROM hospital_data;


-- 2. Average Number of Doctors Per Hospital
-- Retrieve the average count of doctors available in each hospital.
-- Answer:-

SELECT Hospital_Name, AVG(Doctors_Count) AS Average_Count FROM
hospital_data GROUP BY Hospital_Name;


-- 3. Top 3 Departments with the Highest Number of Patients
-- Find the top 3 hospital departments that have the highest number of patients.
-- Answer:-

SELECT Department, SUM(Patients_count) AS Total_Patients FROM hospital_data
GROUP BY Department ORDER BY Total_Patients DESC LIMIT 3;


-- 4. Hospital With the Maximum Medical Expenses
-- Identify the hospital that recorded the highest medical expenses.
-- Answer:-

SELECT Hospital_Name, SUM(Medical_Expenses) AS Total_Medical_Expenses
FROM hospital_data GROUP BY Hospital_Name
ORDER BY Total_Medical_Expenses DESC LIMIT 1;


-- 5. Daily Average Medical Expenses
-- Calculate the average medical expenses per day for each hospital.
-- Answer:-

SELECT Hospital_Name, AVG(Medical_Expenses) AS
Daily_Average_Medical_Expenses FROM hospital_data
GROUP BY Hospital_Name;


-- 6. Longest Hospital Stay
-- Find the patient with the longest stay by calculating the difference between
-- Discharge Date and Admission Date.
-- Answer:-

SELECT Department, Admission_date, Discharge_date,
DATEDIFF(STR_TO_DATE(Discharge_date, '%d-%m-%Y'),
STR_TO_DATE(Admission_date, '%d-%m-%Y')) AS stay_duration FROM
hospital_data WHERE Admission_date IS NOT NULL AND Discharge_date IS NOT
NULL ORDER BY stay_duration DESC LIMIT 1;


-- 7. Total Patients Treated Per City
-- Count the total number of patients treated in each city.
-- Answer:-

SELECT Hospital_Name,Location, SUM(Patients_count) AS Total_Patients_Treated
FROM hospital_data GROUP BY Location;


-- 8. Average Length of stay Per Department
-- Calculate the average number of days patients spend in each department.
-- Answer:-

SELECT Department,
ROUND(AVG(DATEDIFF( STR_TO_DATE(Discharge_date, '%d-%m-%Y'),
STR_TO_DATE(Admission_date, '%d-%m-%Y') )), 2) AS average_stay_days FROM
hospital_data WHERE Admission_date IS NOT NULL AND Discharge_date IS NOT
NULL GROUP BY Department;


-- 9. Identify the Department with the Lowest Number of Patients
-- Find the department with the least number of patients.
-- Answer:-

SELECT Hospital_Name,Department,
SUM(Patients_count) AS Total_Patients FROM hospital_data
GROUP BY Department ORDER BY Total_Patients LIMIT 1;


-- 10. Monthly Medical Expenses Report
-- Group the data by month and calculate the total medical expenses for each month.
-- Answer:-

SELECT MONTHNAME(STR_TO_DATE(Admission_date, '%d-%m-%Y')) AS
Month_Name,
SUM(Medical_Expenses) AS Total_Expenses
FROM hospital_data
WHERE Admission_date IS NOT NULL
GROUP BY MONTHNAME(STR_TO_DATE(Admission_date, '%d-%m-%Y'))
ORDER BY STR_TO_DATE(Admission_date, '%d-%m-%Y');

