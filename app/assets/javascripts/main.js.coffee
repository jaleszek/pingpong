@pingpong = angular.module('pingpong', ['pingpong.services', 'pingpong.controllers', 'ngSanitize'])

@pingpong.config(['$routeProvider', ($routeProvider) ->
	$routeProvider.
		when('/gists', {
			templateUrl: '../templates/gists/index.html',
			controller: 'GistIndexCtrl'
			}).

		when('/gists/new',{
			templateUrl: '../templates/gists/new.html',
			controller: 'GistCreationCtrl'
			}).
    when('/gists/:id/challenges/new', {
      controller: 'GistCreationCtrl',
      templateUrl: '../templates/gists/challenges/new.html'
    }).
		when('/gists/:id', {
			templateUrl: '../templates/gists/show.html',
			controller: 'GistShowCtrl'
			}).
		when('/gists/:id/edit',{
			controller: 'GistDetailsCtrl',
			templateUrl: '../templates/gists/edit.html'
			}).
		when('/sign_up', {
      templateUrl: '../templates/registrations/new.html',
      controller: 'SignUpCtrl'
      }).
		when('/sign_in', {
     templateUrl: '../templates/sessions/new.html',
     controller: 'SignInCtrl'
    }).
    when('/sign_out', {
    	controller: 'SignOutCtrl',
    	template: " "
    }).
		otherwise({
			templateUrl: '../templates/gists/index.html',
			controller: 'GistIndexCtrl'
			})
])