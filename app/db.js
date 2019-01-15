const mysql = require('mysql');

const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_DB
});

connection.connect();

module.exports.getSlotTypes = async () => {
  return new Promise((resolve, reject) => {
    connection.query(`
      SELECT * FROM slot_types
    `, (err, results) => {
      if (err) reject(err);
      resolve(results);
    });
  });
};

module.exports.getSlotType = async (id) => {
  return new Promise((resolve, reject) => {
    connection.query(`
      SELECT * FROM slot_types WHERE id = ${id}
    `, (err, results) => {
      if (err) reject(err);
      resolve(results[0]);
    });
  })
};

module.exports.createSlotType = async (slotType) => {
  return new Promise((resolve, reject) => {
    connection.query(`
      INSERT INTO slot_types (type)
      VALUES ('${slotType.type}')
    `, (err, results) => {
      if (err) reject(err);
      slotType.id = results.insertId;
      resolve(slotType);
    });
  });
};

module.exports.getTemplate = async (id) => {
  return new Promise((resolve, reject) => {
    connection.query(`
    SELECT * FROM mad_lib_templates WHERE id = ${id}
    `, (err, results) => {
      if (err) reject(err);
      resolve(results[0]);
    });
  })
};