const express = require('express');
const app = express();

app.use(express.json());

app.post('/api/auth/login', (req, res) => {
  const { email, password } = req.body;

  if (email === 'alice@lab.local' && password === 'alice123') {
    return res.json({
      token: 'demo-token'
    });
  }

  res.status(401).json({ error: 'Invalid credentials' });
});

app.listen(3001, () => {
  console.log('[auth-service] Running on :3001');
});