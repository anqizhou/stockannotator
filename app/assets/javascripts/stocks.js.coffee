# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  $.getJSON "http://localhost:3000/price.json", (data) ->

    # Create the chart
    $("#container").highcharts "StockChart",
      rangeSelector:
        selected: 1

      title:
        text: "STOCK PRICE"

      series: [
        name: "DUMMY"
        data: data
        tooltip:
          valueDecimals: 2
      ]

    return

  return