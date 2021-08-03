'user strict';
var dbConn = require('./../../config/db.config');

//Help object create
var Help = function(help){
    this.has_emp  = help.has_emp;
    this.wants_emp  = help.wants_emp;
    this.level_diff  = help.level_diff;
    this.debug  = help.debug;
};


Help.findById = function (id, result) {
    dbConn.query("Select * from view_all_matches where has_emp = ? ", id, function (err, res) {             
        if(err) {
            console.log("error: ", err);
            result(err, null);
        }
        else{
            console.log(res);
            result(null, res);
        }
    });   
};



// Dupe of find by id
Help.findCanHelpById = function (id, result) {
    dbConn.query("Select * from view_all_matches where has_emp = ? ", id, function (err, res) {             
        if(err) {
            console.log("error: ", err);
            result(err, null);
        }
        else{
            console.log(res);
            result(null, res);
        }
    });   
};

Help.findNeedsHelpById = function (id, result) {
    dbConn.query("Select * from view_all_matches where wants_emp = ? ", id, function (err, res) {             
        if(err) {
            console.log("error: ", err);
            result(err, null);
        }
        else{
            console.log(res);
            result(null, res);
        }
    });   
};



Help.findAll = function (result) {
    dbConn.query("Select * from view_all_matches", function (err, res) {
        if(err) {
            console.log("error: ", err);
            result(null, err);
        }
        else{
            result(null, res);
        }
    });   
};

module.exports= Help;