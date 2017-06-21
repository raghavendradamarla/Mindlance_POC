// Declares how the application should be bootstrapped. See: http://docs.angularjs.org/guide/module
angular.module('app',
    [
        // Dependency Inject Goes inside this array
        'ui.router',  // we inject/load ui-router for routing
        'app.controllers', // we inject/load the controllers
    ]
);