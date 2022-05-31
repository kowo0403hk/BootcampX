SELECT 
  c.name AS cohort_name,
  COUNT(DISTINCT s.name) AS student_count
FROM cohorts c JOIN students s
  ON c.id = s.cohort_id
GROUP BY c.name
HAVING COUNT(DISTINCT s.name) >= 18
ORDER BY student_count;