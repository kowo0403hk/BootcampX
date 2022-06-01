SELECT
  c.name As name,
  AVG(ar.completed_at - ar.started_at) AS avg_cohort_assistance_time
FROM students s
  JOIN assistance_requests ar ON s.id = ar.student_id
  JOIN cohorts c ON c.id = s.cohort_id
GROUP BY c.name
ORDER BY avg_cohort_assistance_time;