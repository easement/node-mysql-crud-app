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

module.exports= Goal;