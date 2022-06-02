require('dotenv').config();
const { Pool } = require('pg');

const config = {
  user: process.env.DB_user,
  password: process.env.DB_password,
  host: process.env.DB_host,
  database: process.env.DB_database
}

const pool = new Pool(config);

const input = process.argv[2];

pool.query(`
  SELECT DISTINCT t.name
  FROM teachers t
    JOIN assistance_requests a ON t.id = a.teacher_id
    JOIN students s ON a.student_id = s.id
    JOIN cohorts c ON s.cohort_id = c.id
  WHERE c.name = $1
`, [input])
  .then((res) => {
    res.rows.forEach((row) => {
      console.log(`${input}: ${row.name}`);
    })
    pool.end();
  })
  .catch((err) => {
    console.log('Error: ', err);
  });