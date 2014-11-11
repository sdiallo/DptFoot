DptFoot.factory 'Participation', ['$resource', 'Current', ($resource, Current) ->

  return $resource '/participations/:participationId.json', { placeId: '@placeId', participationId: '@participationId' },
    update:
      method: 'PUT'

]