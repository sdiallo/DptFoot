DptFoot.controller 'PlaceCtrl', ['$scope', '$stateParams', '$filter', 'Place', 'Participation', 'Current', ($scope, $stateParams, $filter, Place, Participation, Current) ->

  Place.get { id: $stateParams['placeId'] }, (place, status) ->
    $scope.place = place

    if !angular.isUndefined(Current.user)
      $scope.user = Current.user

    return if $scope.has_no_participations(place.participations_with_users)
    
    participation = $filter('filter')(place.participations_with_users, (participation) -> return participation.user.id == $scope.user.id)
    $scope.is_participant = participation.length > 0

  $scope.participate = () ->
    Participation.save { participation: { user_id: $scope.user.id, place_id: $scope.place.id } }
    , success = (participation) ->
      $scope.is_participant = true
      $scope.place.participations_with_users.push(participation)
    , error = (data) ->
      alert data


  $scope.has_no_participations = (resource) ->
    if resource.length < 1
      $scope.is_participant = false
      return true
    return false
]
