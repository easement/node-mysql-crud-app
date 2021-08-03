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


// todo - clean up routing. this one may not be needed.
// exports.findById = function(req, res) { 
//     // Can help folks
//     if (!('get_help' in req.body)) {
//         console.log("gives help");
//         Help.findCanHelpById(req.params.id, function(err, help) {
//             if (err)
//             res.send(err);
//             res.json(help);
//         });
//     } else { // Needs help from folks
//         console.log("gets help");
//         Help.findNeedsHelpById(req.params.id, function(err, help) {
//             if (err)
//             res.send(err);
//             res.json(help);
//         });
//     }


// };

exports.findGetHelpById = function(req, res) {
    console.log("gets help");
    Help.findNeedsHelpById(req.params.id, function(err, help) {
        if (err)
        res.send(err);
        res.json(help);
    });
}


exports.findGiveHelpById = function(req, res) {
    console.log("gives help");
    Help.findCanHelpById(req.params.id, function(err, help) {
        if (err)
        res.send(err);
        res.json(help);
    });
};


