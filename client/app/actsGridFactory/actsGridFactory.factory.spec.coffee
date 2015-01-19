'use strict'

describe 'Factory: actsGridFactory', ->

  # load the service's module
  beforeEach module 'adminApp'

  # instantiate service
  actsGridFactory = undefined
  beforeEach inject (_actsGridFactory) ->
    actsGridFactory = _actsGridFactory_

  beforeEach inject (_$httpBackend_, $controller, $rootScope) ->
    $httpBackend = _$httpBackend_
    $httpBackend.expectGET('/domain/acts.json').respond [
      '[ { "title": "Hello World 2", "author": "Ben Hollis", "body": "This is an example. 222" },
		 { "title": "Hello World 3", "author": "Ben Hollis", "body": "This is an example. 222" } ]'
    ]
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl',
      $scope: scope

  it 'should do something', ->
    expect(!!actsGridFactory.getAll()).toBe true
