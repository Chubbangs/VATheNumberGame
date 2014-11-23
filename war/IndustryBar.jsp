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

</style>
<body class='with-3d-shadow with-transitions'>

<div style="width: 100%; height: 400px;">
<svg id="test1"></svg>
</div>
<script src="js2/d3.v3.js"></script>
<script src="js2/nv.d3.js"></script>
<script src="js2/axis.js"></script>
<script src="js2/discreteBar.js"></script>
<script src="js2/discreteBarChart.js"></script>
<script src="js2/utils.js"></script>

<script> 

var chart;
d3.json('ByCountry.json', function(data) {
	
	nv.addGraph(function() {
		chart = nv.models.discreteBarChart();
		  chart
		  .x(function(d) { return d.Industry })
	      .y(function(d) { return d.value })
	      .color(["#d62728"])
		   .showValues(true)
		   .staggerLabels(true)
		    .transitionDuration(250)
		    ;
	
	  // chart sub-models (ie. xAxis, yAxis, etc) when accessed directly, return themselves, not the parent chart, so need to chain separately
	  chart.xAxis
	    .axisLabel("Industry")
	     .tickFormat(function(d, i){
	    	 return d;
	     });
	
	  chart.yAxis
	    .axisLabel('FDI (S$)');
	
	  chart.showXAxis(true);
	
	  d3.select('#test1')
	    .datum(data)
	    .transition().duration(0)
	    .call(chart);
	
	  //TODO: Figure out a good way to do this automatically
	  nv.utils.windowResize(chart.update);
	  nv.utils.windowResize(function() { d3.select('#test1 svg').call(chart) });
	  d3.selectAll(".nv-bar").on("click", function () {
		    
		});
	 // chart.dispatch.on('stateChange', function(e) { nv.log('New State:', JSON.stringify(e)); });
	
	  return chart;
	});
});


</script>
