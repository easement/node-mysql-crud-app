const express = require('express');
const bodyParser = require('body-parser');
const path = require('path');

// create express app
const app = express();

// Setup server port
const port = process.env.PORT || 5000;

// parse requests of content-type - application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }))

// parse requests of content-type - application/json
app.use(bodyParser.json())

// define a root route
// app.get('/', (req, res) => {
//   res.send("Hello World");
// });

app.get('/', function(req, res) {
  res.sendFile(path.join(__dirname, '/index.html'));
});

app.get('/employee', function(req, res) {
  res.sendFile(path.join(__dirname, '/employee.html'));
});



// Require employee routes
const employeeRoutes = require('./src/routes/employee.routes')
const helpRoutes = require('./src/routes/help.routes')
const goalRoutes = require('./src/routes/goal.routes')

// using as middleware
app.use('/api/v1/employees', employeeRoutes)
app.use('/api/v1/help', helpRoutes)
app.use('/api/v1/goals', goalRoutes)

// listen for requests
app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});