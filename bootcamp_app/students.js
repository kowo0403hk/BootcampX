require('dotenv').config();
const { Pool } = require('pg');

const config = {
  user: process.env.DB_user,
  password: process.env.DB_password,
  host: process.env.DB_host,
  database: process.env.DB_database
};

const pool = new Pool(config);

const input = process.argv[2];
const amount = Number(process.argv[3]);

pool.query(`
  SELECT s.id, s.name AS student_name, c.name AS cohort_name
  FROM students s JOIN cohorts c ON s.cohort_id = c.id
  WHERE c.name = $1
  LIMIT $2;
`, [input, amount])
  .then((res) => {
    res.rows.forEach((user) => {
      console.log(`${user.student_name} has an id of ${user.id} and was in the ${user.cohort_name} cohort.`);
    });
    pool.end();
  })
  .catch((err) => {
    console.log('Error: ', err)
  });