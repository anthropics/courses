const express = require('express');
const serveStatic = require('serve-static');
const path = require('path');
const fs = require('fs');

const app = express();
const port = process.env.PORT || 3000;

// Serve static files
app.use(serveStatic(__dirname));

// Convert markdown to HTML for README
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'README.md'));
});

app.listen(port, () => {
  console.log(`Claude Courses server running on port ${port}`);
});