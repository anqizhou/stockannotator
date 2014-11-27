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

  $scope.updateAnnotation = (object) ->
    $http.patch(object.url, object)
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
    jsonObj =  {
        "ticker": $scope.stock
    }
    $http.post('/stocks.json', jsonObj)
      .success (data) ->
        $scope.loadStocks()

  $scope.deleteStock = (id) ->
    $http.delete("/stocks/#{id}.json")
      .success (data) ->
        $scope.loadStocks()
      .error (data) ->
        console.log "Failed to delete"

  $scope.updateStock = (object) ->
    $http.patch(object.url, object)
      .success (data) ->
        $scope.stock()
    .error (data) ->
        console.log "Failed to update"
    jsonObj =  {
        "ticker": $scope.stock
    }


  $scope.saveData = (ticker) ->
    console.log $scope.stock
    $http.get("/prices/load/#{$scope.stock}.json")
      .success (data) ->
        $scope.hideLoadingButton = true
        console.log "Data saved."
      .error (data) ->
        console.log "Failed to save."

  $scope.refreshChart = ->
    checked_tickers = []

    for stock in $scope.stored_stocks
      if stock.checked is true
        console.log stock.ticker
        checked_tickers.push stock.ticker
    console.log checked_tickers
    $http.get('/annotations.json?order=asc')
      .success (data) ->
        displayChart(checked_tickers, data)
      .error (data) ->
        console.log "Failed to get data."
    # Try the localstorage feature below
    localStorage.setItem("list", checked_tickers)


  $scope.loadCheckedtickers = ->
    storedList = localStorage.getItem("list")
    if storedList != null
      storedListArray = storedList.split(",")

      for stock in $scope.stored_stocks
        if stock.ticker in storedListArray is true
          stock.checked = true
      $http.get('/annotations.json?order=asc')
        .success (data) ->
          displayChart(storedListArray, data)
        .error (data) ->
          console.log "Failed to get data."


  $scope.loadStocks()
])
