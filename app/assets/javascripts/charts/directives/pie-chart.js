angular.module('oc')

.directive('ocPieChart', ['$http', '$rootScope', function($http, $rootScope) {
  return {
    restrict: 'E',
    templateUrl: 'charts/pie-chart.html',
    scope: {
      title: '=',
      url: '=',
      chartType: '=?'
    },
    link: function ($scope, $element, $attrs) {
      var ctx = $element[0].querySelector('canvas').getContext('2d');

      // filters
      function filterWatcher() {
        return $rootScope.location + $rootScope.industry + $rootScope.employer;
      };

      var x;

      $scope.$watch(filterWatcher, function (newval, oldval) {
        var locationParam = $rootScope.location || 'None';
        var industryParam = $rootScope.industry || 'None';
        var employerParam = $rootScope.employer || 'None';

        var url = $scope.url + '?&location=' + encodeURIComponent(locationParam) +
          '&industry=' + encodeURIComponent(industryParam) +
          '&employer=' + encodeURIComponent(employerParam);

        console.log(url);

        $http.get(url).then(function (data) {
          if (x != undefined)
            x.destroy();

          if ($scope.chartType == 'pie') {
            x = new Chart(ctx).Pie(data.data.charts);
          } else {
            x = new Chart(ctx).Doughnut(data.data.charts);
          }
        });
      });
    }
  };
}]);
