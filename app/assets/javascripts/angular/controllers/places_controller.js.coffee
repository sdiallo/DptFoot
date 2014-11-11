DptFoot.controller 'PlacesCtrl', ['$scope', '$stateParams', 'Department', ($scope, $stateParams, Department) ->

  $scope.loading = true
  
  Department.query { id: $stateParams['departmentId'] }, (data, status) ->
    $scope.places = data
    $scope.loading = false

]
