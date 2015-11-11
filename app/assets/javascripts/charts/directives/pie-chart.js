angular.module('oc')

.directive('ocPieChart', [function() {
  return {
    restrict: 'E',
    templateUrl: 'charts/pie-chart.html',
    scope: true,
    controller: function($scope) {
    },
    link: function ($scope, $element, $attrs) {
      // console.log("HAIAIAIAI");
      console.log($element[0].querySelector('canvas'));
      var ctx = $element[0].querySelector('canvas').getContext("2d");

      var data = [
          {
              value: 300,
              color:"#F7464A",
              highlight: "#FF5A5E",
              label: "Red"
          },
          {
              value: 50,
              color: "#46BFBD",
              highlight: "#5AD3D1",
              label: "Green"
          },
          {
              value: 100,
              color: "#FDB45C",
              highlight: "#FFC870",
              label: "Yellow"
          }
      ]

      var myNewChart = new Chart(ctx).PolarArea(data);
    }
  };
}]);
