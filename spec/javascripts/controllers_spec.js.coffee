# sudo npm install -g karma
# sudo npm install -g karma-ng-scenario
# karma start spec/javascripts/restauranteur.conf.js
# Problems with installing Karma, skipped

describe 'Gist controllers', ->
	beforeEach module('pingpong')

	describe 'GistIndexCtrl', ->
		it 'sets gists to empty array', inject(($controller) ->
			scope = {}
			ctrl = $controller("GistIndexCtrl",
				$scope: scope
				)
			expect(scope.gists.length).toBe 0
			)