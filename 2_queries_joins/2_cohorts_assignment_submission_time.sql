SELECT SUM(a.duration) AS cohort_total_duration
FROM students s 
  LEFT JOIN assignment_submissions a 
    ON s.id = a.student_id
  LEFT JOIN cohorts c
    ON s.cohort_id = c.id
WHERE c.name = 'FEB12';
