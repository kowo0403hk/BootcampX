SELECT
  s.name AS name,
  AVG(a.duration) AS average_completion_duration,
  AVG(assign.duration) AS average_esimtated_duration
FROM assignment_submissions a
  JOIN students s
    ON a.student_id = s.id
  JOIN assignments assign
    ON a.assignment_id = assign.id
WHERE s.end_date IS NULL
GROUP BY s.name
HAVING AVG(a.duration) < AVG(assign.duration)
ORDER BY average_completion_duration;