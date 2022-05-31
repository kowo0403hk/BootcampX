SELECT 
  s.name AS student_name,
  COUNT(a.*) AS assignment_submissions
FROM students s JOIN assignment_submissions a
  ON s.id = a.student_id
GROUP BY s.name
ORDER BY assignment_submissions DESC;
