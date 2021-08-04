'use strict';

const Goal = require('../models/goal.model');

exports.findAll = function(req, res) {
    Goal.findAll(function(err, goal) {
    if (err)
    res.send(err);
    res.send(goal);
  });
};

exports.findById = function(req, res) {
    Goal.findGoalHelperById(req.params.id, function(err, goal) {
        if (err)
        res.send(err);
        res.json(goal);
    });
}

