-- ═══════════════════════════════════════════════
--  USERS TABLE (auth-service ใช้)
-- ═══════════════════════════════════════════════
CREATE TABLE IF NOT EXISTS users (
  id            SERIAL PRIMARY KEY,
  username      VARCHAR(50)  UNIQUE NOT NULL,
  email         VARCHAR(100) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL,
  role          VARCHAR(20)  DEFAULT 'member',
  created_at    TIMESTAMP    DEFAULT NOW(),
  last_login    TIMESTAMP
);

-- ═══════════════════════════════════════════════
--  TASKS TABLE (task-service ใช้)
--  แก้ไข: เอา REFERENCES ออกเพื่อลด Circular Dependency
-- ═══════════════════════════════════════════════
CREATE TABLE IF NOT EXISTS tasks (
  id          SERIAL PRIMARY KEY,
  user_id     INTEGER      NOT NULL, 
  title       VARCHAR(200) NOT NULL,
  description TEXT,
  status      VARCHAR(20)  DEFAULT 'TODO'    CHECK (status IN ('TODO','IN_PROGRESS','DONE')),
  priority    VARCHAR(10)  DEFAULT 'medium'  CHECK (priority IN ('low','medium','high')),
  created_at  TIMESTAMP    DEFAULT NOW(),
  updated_at  TIMESTAMP    DEFAULT NOW()
);

-- ═══════════════════════════════════════════════
--  LOGS TABLE (log-service ใช้)
-- ═══════════════════════════════════════════════
CREATE TABLE IF NOT EXISTS logs (
  id          SERIAL       PRIMARY KEY,
  service     VARCHAR(50)  NOT NULL,
  level       VARCHAR(10)  NOT NULL    CHECK (level IN ('INFO','WARN','ERROR')),
  event       VARCHAR(100) NOT NULL,
  user_id     INTEGER,
  ip_address  VARCHAR(45),
  method      VARCHAR(10),
  path        VARCHAR(255),
  status_code INTEGER,
  message     TEXT,
  meta        JSONB,
  created_at  TIMESTAMP    DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_logs_service    ON logs(service);
CREATE INDEX IF NOT EXISTS idx_logs_level      ON logs(level);
CREATE INDEX IF NOT EXISTS idx_logs_created_at ON logs(created_at DESC);

-- ═══════════════════════════════════════════════
--  SEED USERS
-- ═══════════════════════════════════════════════
INSERT INTO users (username,email,password_hash,role) VALUES
('alice','alice@lab.local','$2b$10$rgFKRYwJvzcSAyj9YMq6HuWf7wR44vYYf1nkWeeZlq9UJJUuuH3Wm','member'),
('bob','bob@lab.local','$2b$10$qjh7IbRP0i8bUAWLi35houh4.BL45qjlj4OJw4O5XXaOPsLOG6Vqm','member'),
('admin','admin@lab.local','$2b$10$ed3mpXWPmLsxeBIHou2aIOy/Rx1bA/dEM8kpZtkJJ2TLR5GUI5Xia','admin')
ON CONFLICT DO NOTHING;

-- Seed tasks
INSERT INTO tasks (user_id, title, description, status, priority)
SELECT u.id, 'ออกแบบ UI หน้า Login', 'ใช้ Figma ออกแบบ mockup', 'TODO', 'high'
FROM users u WHERE u.username = 'alice';

INSERT INTO tasks (user_id, title, description, status, priority)
SELECT u.id, 'เขียน API สำหรับ Task CRUD', 'Express.js + PostgreSQL', 'IN_PROGRESS', 'high'
FROM users u WHERE u.username = 'alice';

INSERT INTO tasks (user_id, title, description, status, priority)
SELECT u.id, 'ทดสอบ JWT Authentication', 'ใช้ Postman ทดสอบทุก endpoint', 'TODO', 'medium'
FROM users u WHERE u.username = 'bob';

INSERT INTO tasks (user_id, title, description, status, priority)
SELECT u.id, 'Deploy บน Railway', 'ทำ Final Lab ชุดที่ 2', 'TODO', 'medium'
FROM users u WHERE u.username = 'admin';