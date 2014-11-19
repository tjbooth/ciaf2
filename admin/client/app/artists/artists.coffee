'use strict'

angular.module 'adminApp'
.config ($stateProvider) ->
  $stateProvider.state 'artists',
    url: '/artists'
    templateUrl: 'app/artists/artists.html'
    controller: 'ArtistsCtrl'
