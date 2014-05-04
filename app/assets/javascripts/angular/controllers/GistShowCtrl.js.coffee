@pingpong.controller 'GistShowCtrl', ['$scope', '$http', '$routeParams', '$location', '$rootScope', ($scope, $http, $routeParams,$location,$rootScope) ->
  if !$rootScope.auth_token
    $location.path( "/sign_in" );
    return

  $http.get("./gists/#{$routeParams.id}.json").success((data) ->
    $scope.gist = data
  )

  $scope.editGist= (id) ->
    $location.path("/gists/#{id}/edit")
]