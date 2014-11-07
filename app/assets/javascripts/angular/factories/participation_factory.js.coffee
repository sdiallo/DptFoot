DptFoot.factory 'Participation', ['$resource', 'Current', ($resource, Current) ->

  return $resource '/participations/:participationId.json', { placeId: '@placeId', participationId: '@participationId', auth_token: Current.auth_token },
    update:
      method: 'PUT'

]