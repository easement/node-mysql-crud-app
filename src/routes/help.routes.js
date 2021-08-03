const express = require('express')
const router = express.Router()
const helpController = require('../controllers/help.controller');

// Retrieve all employees
router.get('/', helpController.findAll);

// Retrieve a single employee with id
router.get('/:id', helpController.findById);

module.exports = router