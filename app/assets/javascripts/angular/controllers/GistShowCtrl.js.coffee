@pingpong.controller 'GistShowCtrl', ['$scope', '$http', '$routeParams', ($scope, $http, $routeParams) ->
  $http.get("./gists/#{$routeParams.id}.json").success((data) ->
    $scope.gist = data
  )
]