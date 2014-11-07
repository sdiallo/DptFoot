DptFoot.factory 'FriendShip', ['$resource', 'Current', ($resource, Current) ->

  return $resource '/friend_ships/:friendshipId.json', { friendshipId: '@friendshipId' },
    update:
      method: 'PUT'

]