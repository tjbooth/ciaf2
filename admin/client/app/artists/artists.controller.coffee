'use strict'

angular.module 'adminApp'
.controller 'ArtistsCtrl', ($scope) ->
  $scope.message = 'Hello'
  $scope.myData = [ { name: "Moroni", age: 50 },			
					{ name: "Moroni2", age: 52 },			
					{ name: "Michelle", age: 33 } ]
  $scope.gridOptions = { data: 'myData' }
