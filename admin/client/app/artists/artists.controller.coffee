'use strict'

app = angular.module 'adminApp'

d2 = [ { "title": "Hello World", "author": "Ben Hollis", "body": "This is an example." } ]

app.controller 'ArtistsCtrl', ['$scope', 'ActsGridFactory', ($scope, ActsGridFactory) ->
  ActsGridFactory.getAll().then (acts) ->
  	$scope.myData = acts
  
  angular.extend $scope,
  	myData: []
  	gridOptions: { data: 'myData' }
]
