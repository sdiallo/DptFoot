DptFoot.controller 'HomeCtrl', ['$window', 'Current', '$rootScope', '$scope', '$state', '$location', 'User', ($window, Current, $rootScope, $scope, $state, $location, User) ->

  if Current.user && Current.user.id
    $scope.user = Current.user

  $scope.wantConnect = true

  $scope.connectErrors = {}
  $scope.registerErrors = {}

  $scope.register = (user) ->
    User.register { user: { username: user.username, email: user.email, password: user.password } }
    , success = (data) ->
      $scope.setCurrentUser(data)
      $scope.resetErrors()
      $rootScope.$broadcast 'user:logged_in', data
      $scope.redirectOnLogin() if $rootScope.referer?
    , error = (data) ->
      $scope.registerErrors = data.data

  $scope.login = (user) ->
    User.login { user: { login: user.login, password: user.password } }
    , success = (data) ->
      $scope.setCurrentUser(data)
      $scope.resetErrors()
      $rootScope.$broadcast 'user:logged_in', data
      $scope.redirectOnLogin() if $rootScope.referer?
    , error = (data) ->
      $scope.loginError = data.data

      
  $scope.logout = () ->
    User.destroy_session { user: { id: Current.user.id } }, (data) ->
      Current.user = null
      Current.auth_token = null
      $scope.user = null

  $scope.changeWanted = (wanted) ->
    $scope.wantConnect = wanted

  $scope.setCurrentUser = (user) ->
    Current.user = user
    Current.auth_token = user.authentication_token
    $scope.user = user

  $scope.resetErrors = () ->
    $scope.loginError = null
    $scope.registerErrors = null


  $scope.redirectOnLogin = () ->
    $location.url($rootScope.referer)
    $rootScope.referer = null
]