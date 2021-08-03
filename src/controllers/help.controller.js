'use strict';

const Help = require('../models/help.model');

exports.findAll = function(req, res) {
  Help.findAll(function(err, help) {
    console.log('controller')
    if (err)
    res.send(err);
    console.log('res', help);
    res.send(help);
  });
};


exports.findById = function(req, res) {
    // Determine if someone needs help vs giving help
    
    // Can help folks
    if (!('needs' in req.body)) {
        Help.findCanHelpById(req.params.id, function(err, help) {
            if (err)
            res.send(err);
            res.json(help);
        });
    } else { // Needs help from folks
        Help.findNeedsHelpById(req.params.id, function(err, help) {
            if (err)
            res.send(err);
            res.json(help);
        });
    }


};
