const express = require('express');
const path = require('path');
const bodyParser = require('body-parser');
const eventAPI = require("./controllerAPI/api-controller");

const app = express();

// Parse request bodies
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Serve static HTML files
app.use(express.static(path.join(__dirname, 'public')));

// API Routes
app.use("/api/events", eventAPI);

// Start server
const PORT = 3060;
app.listen(PORT, () => {
  console.log(`Server up and running on port ${PORT}`);
});
