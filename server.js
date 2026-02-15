/**
 * Simple HTTP Server for Al-Saegh Center Website
 * 
 * This is a basic Node.js server using Express to serve the static website.
 * For production, consider using a proper web server like Nginx or Apache.
 */

const express = require('express');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 8080;

// Serve static files from the root directory
app.use(express.static(path.join(__dirname)));

// Route for root - serve index.html
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// Start server
app.listen(PORT, () => {
  console.log(`
╔══════════════════════════════════════════════════════╗
║   Al-Saegh Center Website Server                     ║
║                                                      ║
║   Server running at:                                 ║
║   http://localhost:${PORT}                              ║
║                                                      ║
║   Press Ctrl+C to stop the server                   ║
╚══════════════════════════════════════════════════════╝
  `);
});

