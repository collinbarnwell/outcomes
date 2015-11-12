angular.module('oc')

.directive('ocFilterDropdown', ['$rootScope', '$http', function($rootScope, $http) {
  return {
    restrict: 'E',
    scope: {
      filterName: '@',
      optionsUrl: '@'
    },
    templateUrl: 'charts/filter-dropdown.html',
    controller: function($http, $scope) {
      $http.get($scope.optionsUrl).then(function(data) {
        $scope.options = data.data.options;
      });
    },
    link: function ($scope, $element, $attrs) {
      $scope.attrVal = 'None';

      $scope.$watch('attrVal', function (newval, oldval) {
        $rootScope[$scope.filterName] = $scope.attrVal;
      });
    }
  };
}]);
