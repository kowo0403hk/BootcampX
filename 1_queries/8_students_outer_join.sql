SELECT s.name as student_name, email, c.name as cohort_name
FROM students s LEFT JOIN cohorts c ON s.cohort_id = c.id;

SELECT s.name as student_name, email, c.name as cohort_name
FROM students s RIGHT JOIN cohorts c ON s.cohort_id = c.id;

SELECT s.name as student_name, email, c.name as cohort_name
FROM students s FULL OUTER JOIN cohorts c ON s.cohort_id = c.id;