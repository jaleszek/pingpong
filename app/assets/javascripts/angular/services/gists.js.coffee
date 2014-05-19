services = angular.module('pingpong.services', ['ngResource'])

services.factory('GistsFactory', ($resource)->
  $resource('/gists', {}, {
  query: { method: 'GET', isArray: true },
  create: { method: 'POST' }
  })
)

services.factory('GistFactory', ['$resource', ($resource) ->
  $resource('/gists/:id.json', {id: '@id'}, {
    show: { method: 'GET' },
    update: { method: 'PUT'},
    delete: { method: 'DELETE'}
  })
  ]
)

services.factory('ChallengeFactory', ['$resource', ($resource) ->
  $resource('/challenges/:id.json', {id: '@id'},{
    show: { method: 'GET' },
    update: { method: 'PUT'},
    delete: { method: 'DELETE'}
    })
])


services.config ["$httpProvider", ($httpProvider) ->
  # provide CSRF token
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = document.getElementsByName("csrf-token")[0].content
  # provide JSON
  $httpProvider.defaults.headers.common['Accept'] = "application/json"
  $httpProvider.defaults.headers.common['Content-Type'] = "application/json"
  $httpProvider.defaults.headers.common['X-Auth-Token'] = ""
]