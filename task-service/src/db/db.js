const { Pool } = require('pg');
const fs = require('fs');
const path = require('path');

const pool = new Pool({
  host: process.env.DB_HOST || 'postgres',
  port: parseInt(process.env.DB_PORT || '5432'),
  database: process.env.DB_NAME || 'taskboard',
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || 'postgres',
  connectionTimeoutMillis: 5000,
});

async function initDB() {
  let authenticated = false;
  let retries = 5;

  while (!authenticated && retries > 0) {
    try {
      await pool.query('SELECT 1');
      authenticated = true;
      console.log('[task-db] ✅ Connected to PostgreSQL');

      // อ่านไฟล์ SQL จากตำแหน่งที่ถูกต้อง
      // ปกติถ้าอยู่ใน src/db/db.js ไฟล์ init.sql มักจะอยู่ที่ src/db/init.sql
      const sqlPath = path.join(__dirname, 'init.sql');
      
      if (fs.existsSync(sqlPath)) {
        const sql = fs.readFileSync(sqlPath, 'utf8');
        await pool.query(sql);
        console.log('[task-db] 🚀 Tables initialized');
      }
    } catch (err) {
      retries--;
      console.error(`[task-db] ⏳ Retrying... (${retries} left): ${err.message}`);
      await new Promise(res => setTimeout(res, 3000));
    }
  }
}

module.exports = { pool, initDB };