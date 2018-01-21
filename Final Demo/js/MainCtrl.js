angular.module('HomeApp', "").controller('MainCtrl', function($scope) {

  $scope.myArray = [1,2,3,4,5,6,7,8,9];

  $scope.rowFilter = function (data) {

    var rows = [];

    var slices = [3,2,1,3];
    slices.forEach(function (s) {
      rows.push(data.splice(0,s));
    });

    return rows;
  };

  $scope.processArray = $scope.rowFilter($scope.myArray);
});
// filter for add multiple class
app.filter("col", function() {
  return function(value) {
    return ['col-xs-','col-sm-', 'col-md-'].map( function (c) { return c + value} ).join(' ');
  }
});