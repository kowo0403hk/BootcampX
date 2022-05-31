SELECT s.name as student_name, email, c.name as cohort_name
FROM students s JOIN cohorts c ON s.cohort_id = c.id;