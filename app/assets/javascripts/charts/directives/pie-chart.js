angular.module('oc')

.directive('ocPieChart', ['$http', function($http) {
  return {
    restrict: 'E',
    templateUrl: 'charts/pie-chart.html',
    scope: {
      title: '=',
      url: '=',
      chartType: '=?'
    },
    link: function ($scope, $element, $attrs) {
      var ctx = $element[0].querySelector('canvas').getContext("2d");

      $http.get($scope.url).then(function (data) {
        if ($scope.chartType == 'pie') {
          var x = new Chart(ctx).Pie(data.data.charts);
        } else {
          var x = new Chart(ctx).Doughnut(data.data.charts);
        }
      });
    }
  };
}]);
