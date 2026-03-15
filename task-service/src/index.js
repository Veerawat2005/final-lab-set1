require('dotenv').config();
const express = require('express');
const cors    = require('cors');
const morgan  = require('morgan');
const { initDB } = require('./db/db');
const taskRoutes = require('./routes/tasks');

const app  = express();
const PORT = process.env.PORT || 3002;

app.use(cors());
app.use(express.json());
app.use(morgan('combined', {
  stream: { write: (msg) => console.log(msg.trim()) }
}));

app.use('/api/tasks', taskRoutes);
app.use((req, res) => res.status(404).json({ error: 'Route not found' }));

async function start() {
  let retries = 10;
  let success = false;

  while (retries > 0) {
    try { 
      await initDB(); 
      success = true; // มาร์คไว้ว่าสำเร็จ
      break; 
    } catch (err) {
      console.log(`[task-service] Waiting for DB... (${retries} retries left)`);
      retries--;
      await new Promise(r => setTimeout(r, 3000));
    }
  }

  if (!success) {
    console.error("[task-service] ❌ Could not connect to DB after 10 retries. Exiting...");
    process.exit(1); // สั่งให้ Container หยุดทำงาน (เพื่อให้ Docker restart ใหม่)
    return;
  }

  app.listen(PORT, () => console.log(`[task-service] ✅ Running on port ${PORT}`));
}

start();