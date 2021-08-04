'user strict';
var dbConn = require('./../../config/db.config');

//Goal object create
var Goal = function(goal){
    this.id  = goal.id;
    this.name  = goal.name;
};
Goal.create = function (newGoal, result) {    
    dbConn.query("INSERT INTO goals set ?", newGoal, function (err, res) {
        if(err) {
            console.log("error: ", err);
            result(err, null);
        }
        else{
            console.log(res.insertId);
            result(null, res.insertId);
        }
    });           
};
Goal.findById = function (id, result) {
    dbConn.query("Select * from goals where id = ? ", id, function (err, res) {             
        if(err) {
            console.log("error: ", err);
            result(err, null);
        }
        else{
            result(null, res);
        }
    });   
};
Goal.findAll = function (result) {
    dbConn.query("Select * from goals", function (err, res) {
        if(err) {
            console.log("error: ", err);
            result(null, err);
        }
        else{
            console.log('goals : ', res);  
            result(null, res);
        }
    });   
};
Goal.update = function(id, goal, result){
  dbConn.query("UPDATE goals SET name=? WHERE id = ?", [goal.name, id], function (err, res) {
        if(err) {
            console.log("error: ", err);
            result(null, err);
        }else{   
            result(null, res);
        }
    }); 
};
Goal.delete = function(id, result){
     dbConn.query("DELETE FROM goals WHERE id = ?", [id], function (err, res) {
        if(err) {
            console.log("error: ", err);
            result(null, err);
        }
        else{
            result(null, res);
        }
    }); 
};

// We can leverage the help_give view!
Goal.findGoalHelperById = function (goal_id, result) {
    dbConn.query("Select * from help_give where goal_id = ? group by has_emp order by has_emp_level asc", [goal_id], function (err, res) {             
        if(err) {
            console.log("error: ", err);
            result(err, null);
        }
        else{
            console.log("modelllll");
            result(null, res);
        }
    });   
};

module.exports= Goal;