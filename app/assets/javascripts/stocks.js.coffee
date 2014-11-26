# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


@displayChart = (tickersArray) ->
  console.log "display data", tickersArray

  seriesOptions = []
  seriesCounter = 0
  names = tickersArray

  # create the chart when all data is loaded
  createChart = ->
    $("#container").highcharts "StockChart",
      rangeSelector:
        selected: 1

      yAxis:
        labels:
          formatter: ->
            ((if @value > 0 then " + " else "")) + @value + "%"

        plotLines: [
          value: 0
          width: 2
          color: "silver"
        ]

      plotOptions:
        series:
          compare: "percent"

      tooltip:
        pointFormat: "<span style=\"color:{series.color}\">{series.name}</span>: <b>{point.y}</b> ({point.change}%)<br/>"
        valueDecimals: 2

      series: seriesOptions

    return

  $.each names, (i, name) ->
    $.getJSON "/prices/#{name}.json", (data) ->
      seriesOptions[i] =
        name: name
        data: data
      seriesCounter += 1

      if seriesCounter == names.length
        createChart()
      return

    return
  return