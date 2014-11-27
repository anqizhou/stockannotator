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
    jsonObj =
      title: $scope.title,
      date: $scope.annodate,
      content: $scope.annotation

    $http.post('/annotations.json', jsonObj)
      .success (data) ->
        $scope.loadAnnotations()

  $scope.deleteAnnotation = (id) ->
    $http.delete("/annotations/#{id}.json")
      .success (data) ->
        $scope.loadAnnotations()
      .error (data) ->
        console.log "Failed to delete"

  $scope.updateAnnotation = (object) ->
    $http.patch(object.url, object)
      .success (data) ->
        $scope.loadAnnotations()
      .error (data) ->
        console.log "Failed to update"

  $scope.loadAnnotations()
])


Annotation.controller("StockController", ["$scope", "$http", ($scope, $http) ->
  $scope.hideLoadingButton = true

  $scope.loadStocks = ->
    $http.get('/stocks.json')
      .success (data) ->
        $scope.stored_stocks = data
        $scope.loadCheckedtickers()
      .error (data) ->
        console.log "Failed to get data."

  $scope.submitStock = ->
    $scope.hideLoadingButton = false
    jsonObj =
      ticker: $scope.stock

    $http.post('/stocks.json', jsonObj)
      .success (data) ->
        $scope.loadStocks()

  $scope.deleteStock = (id) ->
    $http.delete("/stocks/#{id}.json")
      .success (data) ->
        $scope.loadStocks()
      .error (data) ->
        console.log "Failed to delete"

  $scope.saveData = (ticker) ->
    console.log $scope.stock
    $http.get("/prices/load/#{$scope.stock}.json")
      .success (data) ->
        $scope.hideLoadingButton = true
      .error (data) ->
        console.log "Failed to save."

  $scope.refreshChart = ->
    checked_tickers = []

    for stock in $scope.stored_stocks
      if stock.checked is true
        checked_tickers.push stock.ticker

    $scope.sendToDisplay(checked_tickers)

    # Try the localstorage feature below
    localStorage.setItem("list", checked_tickers)


  $scope.loadCheckedtickers = ->
    storedList = localStorage.getItem("list")
    if storedList != null
      storedListArray = storedList.split(",")

      for stock in $scope.stored_stocks
        if stock.ticker in storedListArray is true
          stock.checked = true

      $scope.sendToDisplay(storedListArray)

  $scope.sendToDisplay = (tickers) ->
    $http.get('/annotations.json?order=asc')
      .success (data) ->
        displayChart(tickers, data)
      .error (data) ->
        console.log "Failed to get data."


  $scope.loadStocks()
])
