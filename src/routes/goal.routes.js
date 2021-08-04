const express = require('express')
const router = express.Router()
const goalController = require('../controllers/goal.controller');

// Retrieve all employees
router.get('/', goalController.findAll);

router.get('/:id', goalController.findById);

module.exports = router