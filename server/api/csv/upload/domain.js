'use strict';

var mongoose = require('mongoose');

var schema = mongoose.Schema;

var exports = module.exports = { };

var actSchema = new mongoose.Schema({
		name: String,
		description: String,
		start: Number,
		end: Number,
		genre: String
	});

exports.act = mongoose.model('Act', actSchema);

exports.upsert = function(data){
	exports.act.findOneAndUpdate(
		{ "name": data.name },
		data,
		{ upsert: true },
		function(err, thing){
			if(err) throw err;
		})
}

var eventDaySchema = new schema({
	name : String,
	date : Date,
	startTime : Date,
	endTime : Date
});

var eventTypeSchema = new schema({
	name : String,
	owner : String,
	ownerEmail : String
});

var eventLocationSchema = new schema({
	name : String,
	description : String
});

var contributorSchema = new schema({
	name : String,
	type : String
});

var festivalEvent = new schema({
	eventDay : [eventDaySchema],
	eventType : [eventTypeSchema],
	eventLocation : [eventLocationSchema],
	eventName : String,
	start : Date,
	end : Date,
	contributor : [contributorSchema],
	description : String
});

festivalEvent.methods.setEventDay = function setEventDay (eventDayName) {
  return this.eventDay.push({ name : eventDayName });
};

exports.FestivalEvent  = mongoose.model('FestivalEvent', festivalEvent);
