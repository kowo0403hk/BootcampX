SELECT
  t.name AS teacher,
  c.name AS cohort,
  COUNT(r.teacher_id) AS total_cohort_assistance
FROM
  teachers t 
  JOIN assistance_requests r
    ON t.id = r.teacher_id
  JOIN students s
    ON s.id = r.student_id
  JOIN cohorts c
    ON c.id = s.cohort_id
WHERE c.name = 'JUL02'
GROUP BY t.name, c.name
ORDER BY t.name;