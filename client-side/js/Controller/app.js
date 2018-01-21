'use strict';

var appModule = angular.module('appModule', ['ngAnimate', 'ngTouch', 'ngDropdowns']);
//Location Dropdown controller
appModule
   .controller('LocationCtrl',
    ['$rootScope', '$scope', 'myservice',
    function ($rootScope, $scope, myservice) {
        $scope.myservice = myservice;   
         $scope.ddSelectOptions = [
    {
        text: 'Select an option',
        divider: true
    }, {
        text: 'Option1',
        value: 'one',
        iconCls: 'someicon'
    }, {
        text: 'Option2',
        someprop: 'somevalue'
    }, {
        divider: true
    }, {
        text: 'Option4',
        href: 'http://www.google.com'
    }
  ];

    $scope.ddSelectSelected = {
        text: "Location"
    };

    $scope.ddMenuOptions = [
    {
        text: 'Select an option',
        divider: true
    }, {
        text: 'Option1',
        iconCls: 'someicon'
    }, {
        text: 'Option2'
    }, {
        divider: true
    }, {
        text: 'A link',
        href: 'http://www.google.com'
    }
  ];

    $scope.ddMenuSelected = {};
    $scope.ddMenuOptions2 = [
    {
        name: 'Option2-1 Name',
        iconCls: 'someicon'
    }, {
        name: 'Option2-2 Name'
    }, {
        divider: true
    }, {
        name: 'A link',
        href: 'http://www.google.com'
    }
  ];

    $scope.ddMenuSelected2 = {};
    $scope.ddMenuOptions3 = [
    {
        text: 'Option3-1',
        iconCls: 'someicon'
    }, {
        text: 'Option3-2'
    }, {
        divider: true
    }, {
        text: 'A link',
        href: 'http://www.google.com'
    }
  ];

    $scope.ddMenuSelected3 = {};

       
  }]);

  //Carousel controller
   appModule
   .controller('CarouselCtrl',
    ['$rootScope', '$scope', 'myservice',
    function ($rootScope, $scope, myservice) {
        $scope.myservice = myservice;
        // Set of Photos
        $scope.photos = [
        { src: 'images/LightHouse.jpg', desc: 'Image 01' },
        { src: 'images/Desert.jpg', desc: 'Image 02' },
        { src: 'images/image1.jpg', desc: 'Image 03' },
        { src: 'images/image3.jpg', desc: 'Image 04' },
        { src: 'images/LightHouse.jpg', desc: 'Image 05' },
        { src: 'images/image2.jpg', desc: 'Image 06' }
    ];
        
        // initial image index
        $scope._Index = 0;

        // if a current image is the same as requested image
        $scope.isActive = function (index) {
            return $scope._Index === index;
        };

        // show prev image
        $scope.showPrev = function () {
            
            $scope._Index = ($scope._Index > 0) ? --$scope._Index : $scope.photos.length - 1;
        };

        // show next image
        $scope.showNext = function () {
            $scope._Index = ($scope._Index < $scope.photos.length - 1) ? ++$scope._Index : 0;
        };

        // show a certain image
        $scope.showPhoto = function (index) {
            $scope._Index = index;
        };

    } ]);
    //Filter for Repeats(Grid)

//    app.filter('startsWithA', function () {
//        $scope.contestData = [
//                { src: 'http://farm9.staticflickr.com/8042/7918423710_e6dd168d7c_b.jpg', desc: 'Image 01', price: '500' },
//                { src: 'http://farm9.staticflickr.com/8449/7918424278_4835c85e7a_b.jpg', desc: 'Image 02', price: '400' },
//                { src: 'http://farm9.staticflickr.com/8457/7918424412_bb641455c7_b.jpg', desc: 'Image 03', price: '300' },
//                { src: 'http://farm9.staticflickr.com/8179/7918424842_c79f7e345c_b.jpg', desc: 'Image 04', price: '600' },
//                { src: 'http://farm9.staticflickr.com/8315/7918425138_b739f0df53_b.jpg', desc: 'Image 05', price: '500' },
//                { src: 'http://farm9.staticflickr.com/8461/7918425364_fe6753aa75_b.jpg', desc: 'Image 06', price: '200' },
//                { src: 'http://farm9.staticflickr.com/8461/7918425364_fe6753aa75_b.jpg', desc: 'Image 07', price: '100' }
//            ];
//            var items=$scope.contestData;
//            return function (items) {
//            var filtered = [];
//            for (var i = 0; i < items.length; i++) {
//                var item = items[i];
//                if (/a/i.test(item.name.substring(0, 1))) {
//                    filtered.push(item);
//                }
//            }
//            return filtered;
//        };
    //    });



    //http://stackoverflow.com/questions/14302267/how-to-use-a-filter-in-a-controller
    //Grid controller
    appModule
   .controller('GridCtrl',
    ['$rootScope', '$scope', 'myservice',
    function ($rootScope, $scope, myservice) {
        $scope.myservice = myservice;

        $scope.venueData = [
                { src: 'images/image2.jpg', desc: 'Image 01', price: '500', rating: '3.2' },
                { src: 'images/gridImage2.jpg', desc: 'Image 02', price: '400', rating: '2.1' },
                { src: 'images/LightHouse.jpg', desc: 'Image 03', price: '300', rating: '1.5' },
                { src: 'images/Desert.jpg', desc: 'Image 04', price: '600', rating: '4.2' },
                { src: 'images/LightHouse.jpg', desc: 'Image 05', price: '500', rating: '4.2' },
                { src: 'images/LightHouse.jpg', desc: 'Image 06', price: '200', rating: '3.2' },
                { src: 'images/image2.jpg', desc: 'Image 07', price: '100', rating: '4.7' },
                { src: 'images/LightHouse.jpg', desc: 'Image 08', price: '300', rating: '2.2' },
                { src: 'images/gridImage2.jpg', desc: 'Image 09', price: '300', rating: '2.2' },
                { src: 'images/Desert.jpg', desc: 'Image 10', price: '300', rating: '3.2' },
                { src: 'images/image2.jpg', desc: 'Image 11', price: '300', rating: '4.2' },
                { src: 'images/image2.jpg', desc: 'Image 12', price: '300', rating: '3.2' }
            ];
        $scope.columns = 3;
        $scope.getRows = function (array, columns) {
            var rows = [];

            var i, j, temparray, chunk = columns;
            for (i = 0, j = 9; i < j; i += chunk) {
                temparray = array.slice(i, i + chunk);

                rows.push(temparray);
            }
            
            return rows;
            
        };
        $scope.rows = $scope.getRows($scope.venueData, $scope.columns);




    } ]);
//service to pass data between two controllers
appModule
    .service('myservice', function() {
      
    });

