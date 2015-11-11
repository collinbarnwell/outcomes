angular.module('oc')

.controller('DoughnutCtrl', function ($scope) {
  $scope.labels = ['Download Sales', 'In-Store Sales', 'Mail-Order Sales'];
  $scope.data = [300, 500, 100];
});