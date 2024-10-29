-- How many students have registered for the upcoming career fair？
SELECT COUNT(user_id) as Students_num
FROM Students
NATURAL JOIN Register_CareerFair
Where fair_id = 1; -- Adjust fair_id based on the upcoming fair
/*
Students_num
2
*/

-- Which companies are offering internship positions during the fair?
SELECT DISTINCT c.company_name
FROM Companies c
JOIN Position p ON c.user_id = p.company_id
JOIN Attend_careerFair a ON c.user_id = a.user_id
WHERE p.intern_flag = TRUE
  AND a.fair_id = 4  -- Adjust fair_id based on the fair
  AND a.status = 'confirmed';
  /*
  company_name
  FinanceInc
  */

-- Which company has listed the most job positions in the career fair?
WITH CompanyPositions AS (
    SELECT c.company_name, COUNT(p.position_id) AS Num_positions
    FROM Companies c
    JOIN Position p ON c.user_id = p.company_id
    JOIN Attend_careerFair a ON c.user_id = a.user_id
    WHERE a.fair_id = 5  -- Adjust fair_id based on the fair
      AND a.status = 'confirmed'
    GROUP BY c.company_name
)
SELECT company_name, Num_positions
FROM CompanyPositions cp
ORDER BY Num_positions DESC
LIMIT 1;
/*
company_name  Num_positions
FinaneInc	  3
*/

-- What is the registration count per major for students?
SELECT s.major, COUNT(r.user_id) AS registered_count_per_major
FROM Students s
JOIN Register_CareerFair r ON s.user_id = r.user_id
GROUP BY s.major;
/*
major					registered_count_per_major
Computer Science		1
Information Systems 	1
Data Science	    	1
Cybersecurity			1
Business Analytics  	1
*/

-- How many registered students have attended for the upcoming fair?
SELECT COUNT(DISTINCT a.user_id) AS attended_students_count
FROM Attend_careerFair a
JOIN Register_CareerFair r ON a.fair_id = r.fair_id AND a.user_id = r.user_id
WHERE a.fair_id = 1; -- Adjust fair_id based on the upcoming fair
/*
attend_students_count
2
*/


