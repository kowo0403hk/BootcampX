SELECT 
  COUNT(ar.*) AS total_assistances,
  t.name AS name
FROM teachers t JOIN assistance_requests ar ON t.id = ar.teacher_id
WHERE t.name = 'Waylon Boehm'
GROUP BY t.name;