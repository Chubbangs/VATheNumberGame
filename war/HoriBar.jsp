<!DOCTYPE html>
<meta charset="utf-8">

<link href="js2/nv.d3.css" rel="stylesheet" type="text/css">

<style>

body {
  overflow-y:scroll;
}

text {
  font: 12px sans-serif;
}

#chart1 {

  min-width: 100px;
  min-height: 100px;
/*
  Minimum height and width is a good idea to prevent negative SVG dimensions...
  For example width should be =< margin.left + margin.right + 1,
  of course 1 pixel for the entire chart would not be very useful, BUT should not have errors
*/
}

#chart1 svg {
margin-left:auto;
margin-right:auto;

width:100%;
  height: 400px;
}

</style>
<body>

  <div id="chart1" class='with-3d-shadow with-transitions'>
    <svg></svg>
  </div>

<script src="js2/d3.v3.js"></script>
<script src="js2/nv.d3.js"></script>
<script src="js2/utils.js"></script>
<script src="js2/tooltip.js"></script>
<script src="js2/legend.js"></script>
<script src="js2/axis.js"></script>
<script src="js2/scatter.js"></script>
<script src="js2/line.js"></script>
<script src="js2/lineChart.js"></script>
<script>



d3.json('multiBarHorizontalData.json', function(data) {

var chart;
nv.addGraph(function() {
  chart = nv.models.lineChart()
      .x(function(d) { return d.label })
      .y(function(d) { return d.value })
      .margin({top: 30, right: 20, bottom: 50, left: 175})
      //.showValues(true)
     // .tooltips(false)
      //.barColor(d3.scale.category20().range())
      //.transitionDuration(250)
      //.stacked(true)
     // .showControls(false);
      chart.useInteractiveGuideline(true);
   
  chart.yAxis
      .tickFormat(d3.format(',.2f'));

  d3.select('#chart1 svg')
      .datum(data)
      .call(chart);

  nv.utils.windowResize(chart.update);

  chart.dispatch.on('stateChange', function(e) { nv.log('New State:', JSON.stringify(e)); });

  return chart;
});

});


</script>
