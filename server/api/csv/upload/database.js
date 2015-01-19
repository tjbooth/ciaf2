var mongoose = require('mongoose');

var exports = module.exports = { };

exports.ensureConnection = function() {
	var db = mongoose.connection;

	db.on('error', console.error.bind(console, 'connection error:'));
	db.once('open', function (callback) {
  		console.log("db open");
	});	
}
