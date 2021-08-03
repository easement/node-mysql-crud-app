const express = require('express')
const router = express.Router()
const helpController = require('../controllers/help.controller');

// Retrieve all employees
router.get('/', helpController.findAll);

// Todo - clean this one up. don't think it's needed
// Retrieve a single employee with id 
//router.get('/:id', helpController.findById);

router.get('/:id/get_help', helpController.findGetHelpById);

router.get('/:id/give_help', helpController.findGiveHelpById);

module.exports = router