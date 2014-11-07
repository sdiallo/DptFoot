DptFoot.factory 'Place', ['$resource', ($resource) ->

  return $resource '/places/:id.json', id: '@id',
    update:
      method: 'PUT'

]