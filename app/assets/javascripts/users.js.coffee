# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('.best_in_place').best_in_place()


#######
app = angular.module("LitleShop", ["ngResource"])

@AllProductCtrl = ($scope) ->
	$scope.products = []

	$scope.addProduct = ->
		if $scope.products.length == 0
			$scope.products[0] = 1
		else
			n = $scope.products.length
			v = $scope.products[n-1]
			$scope.products.push(v+1)