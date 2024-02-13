// Import the Express.js framework
const express = require('express');

// Create an Express application
const app = express();

// Define a route that responds with "Hello, World!" when accessed
app.get('/', (req, res) => {
  res.send('Hello, World!');
});

// Set the port for the server to listen on (e.g., 3000)
const port = 3000;

// Start the server and listen on the specified port
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});