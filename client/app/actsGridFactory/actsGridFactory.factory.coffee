'use strict'

angular.module 'adminApp'
	.factory 'ActsGridFactory', ['$http', ($http) ->
		new class ActsGridFactory
		    getAll: ->
		      $http.get('/domain/acts.json').then (result) ->
		       	result.data
			]

  # AngularJS will instantiate a singleton by calling 'new' on this function

  