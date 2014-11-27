# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


@displayChart = (tickersArray, annotations) ->
  console.log "display data", tickersArray
  console.log annotations

  annotation_flags = []
  for singleAnnotation in annotations
    console.log Date.parse(singleAnnotation.date)
    objectFlag = {
              x: Date.parse(singleAnnotation.date)
              title: singleAnnotation.title
            }
    annotation_flags.push objectFlag



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
    return if name == ''

    $.getJSON "/prices/#{name}.json", (data) ->
      seriesOptions[i] =
        name: name
        data: data

      seriesCounter += 1

      if seriesCounter == names.length
        obj1 =
          type: 'flags'
          # name: ''
          data: annotation_flags
          tooltip:
            dateTimeLabelFormats:
              day: "%b %e, %Y"
            pointFormat: ""
            valueDecimals: 1
        seriesOptions.push obj1
        console.log "stored annotations in stocks" + @stored_annotations_passing
        createChart()
      return

    return
  return