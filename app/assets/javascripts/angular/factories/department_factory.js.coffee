DptFoot.factory 'Department', ['$resource', ($resource) ->

  return $resource '/departments/:id.json', id: '@id',
    update:
      method: 'PUT'

]