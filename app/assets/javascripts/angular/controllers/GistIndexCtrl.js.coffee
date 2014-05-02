@pingpong.controller 'GistIndexCtrl', ['$scope', '$location', '$http', ($scope, $location, $http) ->
	$scope.gists = []
	$http.get('./gists.json').success((data) ->
		$scope.gists = data
	)

	$scope.viewGist = (id) ->
		$location.url "/gists/#{id}"
]