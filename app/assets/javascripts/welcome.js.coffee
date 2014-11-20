# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Annotation = angular.module("myAnnotation", [])

Annotation.controller("AnnotationController", ["$scope", "$http", ($scope, $http) ->

  $scope.loadAnnotations = ->
    $http.get('/annotations.json')
      .success (data) ->
        $scope.stored_annotations = data
      .error (data) ->
        console.log "Failed to get data."


  $scope.submitAnnotation = ->
    jsonObj =  {
        "title": $scope.title,
        "date": $scope.annodate,
        "content": $scope.annotation
    }
    $http.post('/annotations.json', jsonObj)
      .success (data) ->
        $scope.loadAnnotations()

  $scope.deleteAnnotation = (id) ->
    $http.delete("/annotations/#{id}.json")
      .success (data) ->
        $scope.loadAnnotations()
      .error (data) ->
        console.log "Failed to delete"

  $scope.updateAnnotation = ->
    $http.patch('/annotations.json', $scope.object)
      .success (data) ->
        $scope.loadAnnotations()
      .error (data) ->
        console.log "Failed to update"
    # jsonObj =  {
    #     "title": $scope.title,
    #     "date": $scope.annodate,
    #     "content": $scope.annotation
    # }
  $scope.loadAnnotations()
])

