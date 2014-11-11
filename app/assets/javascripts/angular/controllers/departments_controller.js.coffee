DptFoot.controller 'DepartmentsCtrl', ['$scope', 'Department', ($scope, Department) ->
  
  $scope.loading = true

  Department.query {}, (data, status) ->
    $scope.departments = data
    $scope.loading = false

]
