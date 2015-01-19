'use strict';

var csv = require("fast-csv");

var fs = require("fs");

var path = require("path");

var bodyParser = require('body-parser');

var busboy = require('connect-busboy');

var moment = require('moment');

var database = require('./database');

var domain = require('./domain');

var express = require('express');

var readCsv = function(req, res){

	database.ensureConnection();

	var fstream;
	
	req.busboy.on('file', function(fieldname, file, filename){
		console.log('uploading: ' + filename);
    	file.pipe(csvStream);
	});

	var csvStream = csv({headers: true})
		.on("data", function(data){
			domain.upsert(data);
		})
		.on("end", function(){
			console.log("done");
			res.end();
		})
		.on('finish', function() {
		      console.log('Done parsing form222!');
		});

	req.pipe(req.busboy);
}

var router = express.Router();

router.post('/', readCsv);

module.exports = router;