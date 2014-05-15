app = angular.module('pingpong.controllers', [])
app.controller('GistIndexCtrl', ['$scope', 'GistsFactory', 'GistFactory', '$location', '$http', '$rootScope', '$routeParams', ($scope,GistsFactory,GistFactory,$location,$http,$rootScope,$routeParams)->
  $rootScope.auth_token = $routeParams.auth_token if $routeParams.auth_token
  # if !$rootScope.auth_token
  #   $location.path( "/sign_in" )
  #   return

  $http.get('./gists.json').success((data) ->
    $scope.gists = data
  )


  $scope.deleteGist = (gist_id) ->
    GistFactory.delete({id: gist_id})
    $scope.gists = GistsFactory.query()
  $scope.createNewGist = ->
    $location.path('/gists/new')
  $scope.viewGist = (id) ->
    $location.url "/gists/#{id}"
])


app.controller('GistDetailsCtrl', ['$scope', '$routeParams', 'GistFactory', '$location', '$rootScope', ($scope,$routeParams,GistFactory,$location,$rootScope) ->
  # if !$rootScope.auth_token
  #   $location.path( "/sign_in" )
  #   return

  $scope.updateGist = ->
    GistFactory.update({id: $scope.gist.id}, $scope.gist)
    $location.path("/gists/#{$scope.gist.id}")

  $scope.cancel = ->
    $location.path("/gists")

  gist = GistFactory.show({id: $routeParams.id})
  $scope.gist = gist

])

app.controller('GistCreationCtrl', ['$scope', 'GistsFactory', '$location','$rootScope','$routeParams',($scope, GistsFactory,$location,$rootScope,$routeParams)->
  # if !$rootScope.auth_token
  #   $location.path( "/sign_in" )
  #   return

  $scope.createNewGist =->
    GistsFactory.create($scope.gist)
    $location.path("/gists")
  $scope.createNewChallenge =->
    gist = $scope.gist
    gist.parent_gist_id = $routeParams.id

    GistsFactory.create(gist)
    $location.path("/gists")
])

app.controller('SignUpCtrl', ['$scope', '$location', '$http', '$rootScope', ($scope, $location, $http, $rootScope) ->
  # if $rootScope.auth_token
  #   $location.path( "/gists" )
  #   return

  $scope.errors = ""
  $scope.signUp = (user) ->
    if user
      payload =
        user:
          email: user.email
          password: user.password
          password_confirmation: user.password_confirmation
      $http.post('./users.json', payload).success((data) ->
        $location.path( "/sign_in" )
      ).error (data) ->
        $scope.errors = data.errors
])

app.controller 'SignInCtrl', ['$scope', '$location', '$http', '$rootScope', ($scope, $location, $http, $rootScope) ->
  # if $rootScope.auth_token
  #   $location.path( "/gists" )
  #   return

  $scope.errors = ""
  $scope.signIn = (session) ->
    if session
      payload =
        email: session.email
        password: session.password
      $http.post('./token_session.json', payload).success((data) ->
        $rootScope.auth_token = data["auth_token"]
        $rootScope.user_id    = data["user_id"]
        $http.defaults.headers.common['X-Auth-Token'] = data["auth_token"]
        $location.path( "/gists" )
        $scope.errors = ""
      ).error(() ->
        session.email = ""
        session.password = ""
        $scope.errors = "Invalid e-mail or password."
      )
]

app.controller 'SignOutCtrl', ['$scope', '$location', '$http', '$rootScope', ($scope,$location,$http,$rootScope) ->
  $rootScope.auth_token = null
  $rootScope.user_id = null
  $http.defaults.headers.common['X-Auth-Token'] = ""
  $http.delete('./users/sign_out', {})
  $location.path( "/sign_in" )
]