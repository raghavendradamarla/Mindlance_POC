//we initialize the module name to 'app.controllers'
// app.js will search for a module called 'app.controllers' and will find this one and inject it
var app = angular.module("mSSApp", []);

app.filter('slice', function () {
    return function (arr, start, end) {
        return arr.slice(start, end);
    };
});

app.controller('PopulationController', function ($scope) {

    
    // Scope Variables
    
    $scope.populations = [];
    $scope.error = "";
    getPopulationData();
    $scope.selectedCity = [];
    $scope.OriginalPopulationData = [];
    $scope.SelectCity = "";
    $scope.start = 0;
    $scope.end = 10;

   // Get the modal
    var modal = document.getElementById('myModal');
    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");
    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    
    $scope.First = function First() {
        $scope.start = 0;
        $scope.end = 10;
        $scope.populations = $scope.OriginalPopulationData.slice($scope.start, $scope.end);
        $scope.$apply();

    }
    $scope.Next = function Next() {
        debugger;
        if ($scope.end != $scope.OriginalPopulationData.length) {
            $scope.start = $scope.end;
            $scope.end = $scope.start + 10;
            $scope.populations = $scope.OriginalPopulationData.slice($scope.start, $scope.end);
            $scope.$apply();
        }
    }
    $scope.Last = function Last() {
        $scope.start = $scope.OriginalPopulationData.length - 10;
        $scope.end = $scope.OriginalPopulationData.length;
        $scope.populations = $scope.OriginalPopulationData.slice($scope.start, $scope.end);
        $scope.$apply();
    }
    $scope.Previous = function Previous() {
        debugger;
        if ($scope.end > 10) {
            $scope.end = $scope.start;

            $scope.start = $scope.end - 10;
            
            
            $scope.populations = $scope.OriginalPopulationData.slice($scope.start, $scope.end);
            $scope.$apply();
        }
    }
    $scope.SearchCity = function SearchCity()
    {
        debugger;
        if ($scope.SelectCity == "" || $scope.SelectCity.length>1)
            getPopulationDataByCity($scope.SelectCity);
        else
            alert('Please Enter City !')
        //'AGAWAM'
        
    }
    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
      

    $scope.Cancel = function Cancel() {
        modal.style.display = "none";
    }

    $scope.DisplaySelectedCity = function DisplaySelectedCity(pop) {
        debugger;
        modal.style.display = "block";
        $scope.selectedCity = pop;
        $scope.modelPopulation = pop.pop;
        $scope.$apply();
    }

    $scope.UpdateCity = function UpdateCity() {
        debugger;
        
        $scope.selectedCity.pop = $scope.modelPopulation;
        UpdateSelectedCity();
    }

    function UpdateSelectedCity() {
        debugger;
        ResetControls();
        $.ajax({
            url: 'api/CityPopulation/',
            type: 'POST',
            dataType: 'json',            
            data: $scope.selectedCity,
            success: function (d) {
                debugger;
                modal.style.display = "none";                
                alert('Population updated Successfully');
                $scope.populations = $scope.OriginalPopulationData.slice(0, 10);                
                $scope.$apply();
            },
            error: function (request, message, error) {
                alert('failure');
                handleException(request, message, error);
            }
        });
    }
    

    function getPopulationDataByCity(city) {
        if (city.length > 0) {
            ResetControls();
            $.ajax({
                url: 'api/CityPopulation/',
                type: 'GET',
                dataType: 'json',
                data: { 'id': city },
                success: function (d) {
                    debugger;
                    if (d.length < 1)
                        alert('City Could not find in JSON file. Please try to search with valid city !!');
                    else
                        $scope.populations = d;

                    $scope.$apply();
                },
                error: function (request, message, error) {
                    alert('failure');
                    handleException(request, message, error);
                }
            });
        }
        else {
            alert('Please enter City!!');
        }
    }

    function getPopulationData() {
        ResetControls();
        $.ajax({
            url: 'api/CityPopulation/',
            type: 'GET',
            dataType: 'json',
            success: function (d) {
                debugger;             
                $scope.populations = d;
                $scope.OriginalPopulationData = d;
                $scope.populations = d.slice($scope.start, $scope.end);
                $scope.$apply();               
            },
            error: function (request, message, error) {
                alert('failure');
                handleException(request, message, error);
            }
        });
    }

    function ResetControls()
    {
        $scope.error = "";
        $scope.modelPopulation = "";
    }

});