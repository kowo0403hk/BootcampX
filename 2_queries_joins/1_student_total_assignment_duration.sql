SELECT SUM(a.duration) AS total_duration
FROM students s JOIN assignment_submissions a
  ON s.id = a.student_id
WHERE s.name = 'Ibrahim Schimmel';