DptFoot.controller 'NavController', ['$rootScope', '$scope', '$state', '$location', 'Current', ($rootScope, $scope, $state, $location, Current) ->

  $scope.user = Current.user

  $scope.setPreviousUrl = () ->
    $rootScope.referer = $location.$$path
    $state.go('home')


  $scope.$on 'user:logged_in', (event, user) ->
    $scope.user = user

]
