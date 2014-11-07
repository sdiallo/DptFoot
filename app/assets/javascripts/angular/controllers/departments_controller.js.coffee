DptFoot.controller 'DepartmentsCtrl', ['$scope', 'Department', ($scope, Department) ->
  
  Department.query {}, (data, status) ->
    $scope.departments = data

]
