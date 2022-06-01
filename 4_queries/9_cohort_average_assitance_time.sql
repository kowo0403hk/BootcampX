SELECT
  AVG(T.total_cohort_assistance_time) as
FROM
  (SELECT
    c.name AS name,
    SUM(ar.completed_at - ar.started_at) AS total_cohort_assistance_time
  FROM students s
  JOIN assistance_requests ar ON s.id = ar.student_id
  JOIN cohorts c ON c.id = s.cohort_id
  GROUP BY c.name
  ORDER BY total_cohort_assistance_time) AS T;