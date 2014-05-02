@pingpong = angular.module('pingpong', [])

@pingpong.config(['$routeProvider', ($routeProvider) ->
	$routeProvider.
		when('/gists', {
			templateUrl: '../templates/gists/index.html',
			controller: 'GistIndexCtrl'
			}).
		when('/gists/:id', {
			templateUrl: '../templates/gists/show.html',
			controller: 'GistShowCtrl'
			}).
		otherwise({
			templateUrl: '../templates/home.html',
			controller: 'HomeCtrl'
			})
])