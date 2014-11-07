DptFoot.controller 'PlacesCtrl', ['$scope', '$stateParams', 'Department', ($scope, $stateParams, Department) ->
  
  Department.query { id: $stateParams['departmentId'] }, (data, status) ->
    $scope.places = data

]
