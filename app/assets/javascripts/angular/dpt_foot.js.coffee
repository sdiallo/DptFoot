window.DptFoot = angular.module 'DptFoot', ['ngResource', 'ngRoute', 'ngAnimate', 'templates', 'ui.router', 'Devise']

DptFoot.config ['$locationProvider', '$stateProvider', '$urlRouterProvider', ($locationProvider, $stateProvider, $urlRouterProvider) ->

  $locationProvider.html5Mode(true)

  $urlRouterProvider.otherwise('/')

  $stateProvider

  .state 'home',
    url: '/'
    templateUrl: 'home.html'
    controller: 'HomeCtrl'

  .state 'departments',
    url: '/explore'
    templateUrl: 'departments.html'
    controller: 'DepartmentsCtrl'

  .state 'places',
    url: '/:departmentId/places'
    templateUrl: 'places.html'
    controller: 'PlacesCtrl'

  .state 'place',
    url: '/:departmentId/places/:placeId'
    templateUrl: 'place.html'
    controller: 'PlaceCtrl'

  .state 'user',
    url: '/profiles/:userId'
    templateUrl: 'user.html'
    controller: 'UserCtrl'

]

      