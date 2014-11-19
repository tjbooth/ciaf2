'use strict'

angular.module 'adminApp'
.controller 'NavbarCtrl', ($scope, $location) ->
  $scope.menu = [
    { title: 'Home'
    link: '/' },
    { title: 'Artists', link: '/artists '}
  ]
  $scope.isCollapsed = true

  $scope.isActive = (route) ->
    route is $location.path()