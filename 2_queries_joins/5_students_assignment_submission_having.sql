SELECT 
  s.name AS student_name,
  COUNT(a.*) AS assignment_submissions
FROM students s JOIN assignment_submissions a
  ON s.id = a.student_id
WHERE s.end_date IS NULL
GROUP BY s.name
HAVING COUNT(a.*) < 100;