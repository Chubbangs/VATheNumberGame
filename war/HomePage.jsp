
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">

<title>The Number Game</title>
<link type="text/css" rel="stylesheet" href="HomePage.css">

<style>

text {
  font: 12px sans-serif;
}

.swipe {
  overflow: hidden;
  visibility: hidden;
  position: relative;
}
.swipe-wrap {
  overflow: hidden;
  position: relative;
}
.swipe-wrap > div {
  float:left;
  width:100%;
  position: relative;
}

#chart3, #chart2 {
        height: 350px;
        width:70%;
        margin-right:auto;
        margin-left:auto;
    }
</style>

<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="js/d3.min.js"></script>
<script src="js/topojson.v1.min.js"></script>
<script src="js2/d3.v3.js"></script>
<script src="js2/nv.d3.js"></script>
<script src="js2/utils.js"></script>
<script src="js2/tooltip.js"></script>
<script src="js2/legend.js"></script>
<script src="js2/axis.js"></script>
<script src="js2/scatter.js"></script>
<script src="js2/line.js"></script>
<script src="js2/lineChart.js"></script>
<script src="js/swipe.js"></script>
<link href="js2/nv.d3.css" rel="stylesheet" type="text/css">
<link href="js/style.css" rel="stylesheet" type="text/css">
<script src="js/interactiveLayer.js"></script>
<script src="js/stackedAreaChart.js"></script>
<script src="js2/discreteBar.js"></script>
<script src="js2/discreteBarChart.js"></script>
<script>

	function drawPerCountry(){
		var chart;
		d3.json('ByCountry.json', function(data) {
			
			nv.addGraph(function() {
				chart = nv.models.discreteBarChart();
				  chart
				  .x(function(d) { return d.Industry })
			      .y(function(d) { return d.value })
			      .color(["#d62728"])
				   .showValues(true)
				   //.useInteractiveGuideline(true)
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
			    .axisLabel('Millions of S$');
			
			  chart.showXAxis(true);
			
			  d3.select('#test1')
			    .datum(data)
			    .transition().duration(0)
			    .call(chart);
			
			  //TODO: Figure out a good way to do this automatically
			  nv.utils.windowResize(chart.update);
			  d3.selectAll(".nv-bar").on("click", function () {
		    		drawMiniGraph();
				});
			 // nv.utils.windowResize(function() { d3.select('#chart1 svg').call(chart) });
			
			  //chart.dispatch.on('stateChange', function(e) { nv.log('New State:', JSON.stringify(e)); });
			
			  return chart;
			});
		});

	}


	function drawMiniGraph(){
		
	
    var chart;
    d3.json('Manufacturing.json', function(data) {
    	
    	nv.addGraph(function() {
    		chart = nv.models.discreteBarChart();
    		  chart
    		  .x(function(d) { return d.Country })
    	      .y(function(d) { return d.value })
    	      .color(["#d62728"])
    		   .showValues(true)
    		   .staggerLabels(true)
    		    .transitionDuration(250)
    		    ;
    	
    	  // chart sub-models (ie. xAxis, yAxis, etc) when accessed directly, return themselves, not the parent chart, so need to chain separately
    	  chart.xAxis
    	    .axisLabel("Country")
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
    	  //nv.utils.windowResize(function() { d3.select('#chart1 svg').call(chart) });
    	
    	//  chart.dispatch.on('stateChange', function(e) { nv.log('New State:', JSON.stringify(e)); });
    	d3.selectAll(".nv-bar").on("click", function () {
    		drawPerCountry();
		});
    	  return chart;
    	});
    });
    
	}
    </script>


<script>

	var outerArray = new Array();
	var continentYear ="";

	function getArray(value){
		
		
		
 		d3.csv("data/country-capitals.csv", function(err, capitals) {
 			if (value == 2008){
 				capitals.forEach(function(i){
 	 				var fdiInInt = +i.FDI2008;
 	 				var innerArray = new Array(i.CountryName, i.ContinentName,fdiInInt );	
 	 				outerArray.push(innerArray);
 	 			});
 				
 			} else if (value == 2009){
 				capitals.forEach(function(i){
 	 				var fdiInInt = +i.FDI2009;
 	 				var innerArray = new Array(i.CountryName, i.ContinentName,fdiInInt );	
 	 				outerArray.push(innerArray);
 	 			});
 			} else if (value==2010){
 				capitals.forEach(function(i){
 	 				var fdiInInt = +i.FDI2010;
 	 				var innerArray = new Array(i.CountryName, i.ContinentName,fdiInInt );	
 	 				outerArray.push(innerArray);
 	 			});
 			} else if (value==2011){
 				capitals.forEach(function(i){
 	 				var fdiInInt = +i.FDI2011;
 	 				var innerArray = new Array(i.CountryName, i.ContinentName,fdiInInt );	
 	 				outerArray.push(innerArray);
 	 			});
 			} else if (value == 2012){
 				capitals.forEach(function(i){
 	 				var fdiInInt = +i.FDI2012;
 	 				var innerArray = new Array(i.CountryName, i.ContinentName,fdiInInt );	
 	 				outerArray.push(innerArray);
 	 			});
 			}
 			

 		}); 
	}

 	function drawGraph(value){
 		
 		//window.location.reload();
 		//alert(value);
 		continentYear = "FDI" +value;
 		d3.select(window).on("resize", throttle);
 		getArray(value);
 		
 		var zoom = d3.behavior.zoom()

 	    .scaleExtent([1, 9])
 	    

 	    .on("zoom", move);

 		
 		var width = document.getElementById('container').offsetWidth;
 		var height = width / 2;
 		var topo,projection,path,svg,g;
 		var graticule = d3.geo.graticule();
		var tooltip = d3.select("#container").append("div").attr("class", "tooltip hidden");

		setup(width,height);

		d3.json("data/world-topo-min.json", function(error, world) {
			var countries = topojson.feature(world, world.objects.countries).features;
			topo = countries;
			draw(topo);
		});
		
		
	function setup(width,height){

			projection = d3.geo.mercator()

		    .translate([(width/2), (height/2)])

		    .scale( width / 2 / Math.PI);

			path = d3.geo.path().projection(projection);



			svg = d3.select("#container").append("svg")
			.attr("width", width)
			.attr("height", height)
			.call(zoom)
			.on("click", click)	
			.append("g");
			
			g = svg.append("g");

		}

	function draw(topo) {
		svg.append("path")
		.datum(graticule)
		.attr("class", "graticule")
		.attr("d", path);

		g.append("path")
		.datum({type: "LineString", coordinates: [[-180, 0], [-90, 0], [0, 0], [90, 0], [180, 0]]})
		.attr("class", "equator")
		.attr("d", path);
		
		var country = g.selectAll(".country").data(topo);
		country.enter().insert("path")
		.attr("class", "country")
		.attr("d", path)
		.attr("id", function(d,i) { return d.id; })
		.attr("title", function(d,i) { return d.properties.name; })
		.style("fill", function(d, i) { 	    	  
		var col = d.properties.color;	    	  
		for (count = 0; count < outerArray.length; count++){
		var array = outerArray[count];
		var name = array[0];
		var fdi = array[2];
		if (name == d.properties.name){
			if(fdi<= 1000){
				col = "#39B7CD";
			} else if (fdi >1000 && fdi <= 10000 ){
			   	col = "#98F5FF";
			} else if (fdi > 10000 && fdi <= 20000){
			   	col = "#7AC5CD";
			} else if (fdi > 20000 && fdi <= 30000){
			    col = "#53868B";
			} else if (fdi > 30000 && fdi <= 40000){
			    col = "#528B8B";
			} else if (fdi >50000){
			   	col = "#2F4F4F";
			}     			  
			    break;
			} else {
			   	col = "#C3E4ED"
			}
			    		  
		}   	  
		return col });
		
		var offsetL = document.getElementById('container').offsetLeft+20;

		var offsetT = document.getElementById('container').offsetTop+10;
		country.on("mousemove", function(d,i) {



		var mouse = d3.mouse(svg.node()).map( function(d) { return parseInt(d); } );

		tooltip.classed("hidden", false)

		.attr("style", "left:"+(mouse[0]+offsetL)+"px;top:"+(mouse[1]+offsetT)+"px")

		.html(d.properties.name);

		})
			      

		.on("mouseout",  function(d,i) {

			tooltip.classed("hidden", true);

		})
		.on("click", function(d,it){
			
			var jsonName = d.properties.name.replace(/\s+/g, '') +".json";
			var urlLink = "http://va-project.appspot.com/" + jsonName; 
			$.ajax({
				  url: urlLink, //or your url
				  success: function(data){
				   
				    document.getElementById("test2").style.display= "block";
				    
				    document.getElementById('countryLabel').innerHTML = 'FDI and Returned Earnings of ' + d.properties.name;
					d3.json(jsonName, function(data) {

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
						   
						  chart.xAxis
						  .axisLabel("Year");
						  chart.yAxis
						  	.axisLabel("Millions of S$");
						     

						  d3.select('#chart1 svg')
						      .datum(data)
						      .call(chart);

						  nv.utils.windowResize(chart.update);

						  chart.dispatch.on('stateChange', function(e) { nv.log('New State:', JSON.stringify(e)); });

						  return chart;
						});

						});
				  },
				  error: function(data){
				 
				    document.getElementById('countryLabel').innerHTML = 'There is no data of FDI and Returned Earning of ' +d.properties.name;
				    document.getElementById("test2").style.display= "none";
				  },
				})
			
			
			
		})
		; 





			  //EXAMPLE: adding some capitals from external CSV file
		/*
		d3.csv("data/country-capitals.csv", function(err, capitals) {
			capitals.forEach(function(i){
			      addpoint(i.CapitalLongitude, i.CapitalLatitude, i.CountryName );

			});
		}); */
		if (continentYear == "FDI2008"){
			
			d3.csv("data/Continents.csv", function(err, continents) {
				continents.forEach(function(c){
				      addCircle(c.Longitude, c.Latitude, c.Continent, c.FDI2008 );
				     

				});
			});
		} else if (continentYear == "FDI2009"){
			
			d3.csv("data/Continents.csv", function(err, continents) {
				continents.forEach(function(c){
				      addCircle(c.Longitude, c.Latitude, c.Continent, c.FDI2009 );
				     

				});
			});
			
		} else if (continentYear == "FDI2010") {
		
			d3.csv("data/Continents.csv", function(err, continents) {
				continents.forEach(function(c){
				      addCircle(c.Longitude, c.Latitude, c.Continent, c.FDI2010 );
				     

				});
			});
		} else if (continentYear == "FDI2011") {
			
			d3.csv("data/Continents.csv", function(err, continents) {
				continents.forEach(function(c){
				      addCircle(c.Longitude, c.Latitude, c.Continent, c.FDI2011 );
				     

				});
			});
			
		} else if (continentYear == "FDI2012"){
		
			d3.csv("data/Continents.csv", function(err, continents) {
				continents.forEach(function(c){
				      addCircle(c.Longitude, c.Latitude, c.Continent, c.FDI2012 );
				     

				});
			});
		}
		
		
		//window.location.reload();

		drawLegend();
		//redraw();	 

	}

	function drawLegend(){

		var color_domain = [1000, 10000, 20000, 30000, 40000,50000]
		var ext_color_domain = [0, 1000, 10000, 20000, 30000, 40000,50000]
		var legend_labels = ["NA"," < 1000", "10000+", "20000+", "30000+", "40000+", "> 50000"]              
		var color = d3.scale.threshold()
		.domain(color_domain)
		.range(["#C3E4ED", "#39B7CD", "#98F5FF", "#7AC5CD", "#53868B", "#528B8B","#2F4F4F"]);


		var legend = svg.selectAll("g.legend")
		.data(ext_color_domain)
		.enter().append("g")
		.attr("class", "legend");

		var ls_w = 20, ls_h = 20;

		legend.append("rect")
		.attr("x", 20)
		.attr("y", function(d, i){ return height - (i*ls_h) - 2*ls_h;})
		.attr("width", ls_w)
		.attr("height", ls_h)
		.style("fill", function(d, i) { return color(d); })
		.style("opacity", 0.8);

		legend.append("text")
		.attr("x", 50)
		.attr("y", function(d, i){ return height - (i*ls_h) - ls_h - 4;})
		.text(function(d, i){ return legend_labels[i]; });


	}


	function redraw() {
		

		width = document.getElementById('container').offsetWidth;

		height = width / 2;

		d3.select('svg').remove();

		setup(width,height);

		draw(topo);

	}





	function move() {

	//this is the one to zoom

	var t = d3.event.translate;

	var s = d3.event.scale; 

	zscale = s;

	var h = height/4;

	t[0] = Math.min(

	(width/height)  * (s - 1), 

	Math.max( width * (1 - s), t[0] )

	);



	t[1] = Math.min(

	h * (s - 1) + h * s, 

	Math.max(height  * (1 - s) - h * s, t[1])

	);



	zoom.translate(t);

			  g.attr("transform", "translate(" + t + ")scale(" + s + ")");

			test();

			  //adjust the country hover stroke width based on zoom level

			  d3.selectAll(".country").style("stroke-width", 1.5 / s);



			}







	var throttleTimer;

	function throttle() {

		window.clearTimeout(throttleTimer);

		throttleTimer = window.setTimeout(function() {

		redraw();

		}, 200);

	}





			//geo translation on mouse click in map
	function click() {
		//alert("test");
		//click only
		
		var latlon = projection.invert(d3.mouse(this));

		console.log(latlon);
		/*
		var map = new Datamap({
	        element: document.getElementById('container'),
	        geographyConfig: {
	            popupTemplate: function() {
	                return ['<div ><strong>',
	                        'Number of things in ' + "ss",
	                        ': ' + "ss",
	                        '</strong></div>'].join('');
	            }
	        }
	    }); */

	}





			//function to add points and text to the map (used in plotting capitals)

	function addpoint(lat,lon,text) {
		var gpoint = g.append("g").attr("class", "gpoint");

		var x = projection([lat,lon])[0];

		var y = projection([lat,lon])[1];
		gpoint.append("svg:circle")
		.attr("cx", x)
		.attr("cy", y)
		.attr("class","point")
		.attr("r", 1.5);



			  //conditional in case a point has no associated text

		if(text.length>0){
			gpoint.append("text")
			.attr("x", x+2)
			.attr("y", y+2)
			.attr("class","text")
			.text(text);
		}
	}
	var r =20;
	function addCircle(lat,lon,name,fdi){
		
		var gpoint = g.append("g").attr("class", "gpoint");
		
		var x = projection([lat,lon])[0];

		var y = projection([lat,lon])[1];
		gpoint.append("svg:circle")
		.attr("cx", x)
		.attr("cy", y)
		.attr("class","point")
		.attr("r", r)
		.style("fill","#B40404");
		r = r +5;
		
		if(name.length>0){
			gpoint.append("text")
			.attr("x", x-20)
			.attr("y", y-5)
			.attr("class","text")
			.text(name)
			.attr("font-family","sans-serif")
			.attr("font-size","20px")
			.attr("fill","black");
		}
		
		if(fdi.length>0){
			gpoint.append("text")
			.attr("x", x-20)
			.attr("y", y +5)
			.attr("class","text")
			.text("S$"+fdi)
			.attr("font-family","sans-serif")
			.attr("font-size","20px")
			.attr("fill","black");
		}
		
	}	
	

	
	
 }


</script>

<script>

function test(){
	$(document).ready(function(){
		   $("#Reload").click(function(){
		      $("#result").html("result reloaded successfully");
		   });
		});
	
}
</script>

</head>



<body onload="drawGraph('2008');">



<div style="height:50px; margin-right:auto;margin-left:auto;font-size:30px;text-align:center;vertical-align:middle;">THE NUMBER GAME</div>
<div style="height:50px;">
<img src ="left.png" style="float:left" onclick='mySwipe.prev()' height="42" width="42">
<img src ="right.png" style="float:right" onclick='mySwipe.next()' height="42" width="42">
</div>
<div class="swipe" id='mySwipe'>
 	<div class='swipe-wrap'>
 		<div>
		<div id="timeline">
			<ul>
		    <li class="active"><a href="javascript:drawGraph('2008');">2008</a></li>
		    <li><a href="#" onclick ="drawGraph('2009'); test();">2009</a></li>
		    <li><a href="javascript:drawGraph('2010');test();">2010</a></li>
		    <li><a href="javascript:drawGraph('2011');test();">2011</a></li>
		    <li><a href="javascript:drawGraph('2012');test();">2012</a></li>
		</ul>
		
		
		</div>
		
		
		<div id="container" style="float:left;"></div>
		<div id ="chart1" style="float:right; margin-left:0px; margin-right:0px;"  >
			<label style="margine-left:auto; margin-right:auto;" id="countryLabel"></label>
			<svg id ="test2">
				<g></g>
			</svg>
			
		</div>
		</div>
		
		<div style="background-color:#F0F8FF;">
		
			<div>
        		<svg id="chart3"></svg>
        	</div>
        	<div style="width: 90%; height: 300px; margin-right:auto; margin-left:auto;">
        	2008 - FDI distribution by industry in United States
				<svg id="test1"></svg>
			</div>
    	</div>
	</div>
</div>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src='js/swipe.js'></script>
<script>

// pure JS
var elem = document.getElementById('mySwipe');
window.mySwipe = Swipe(elem, {
  // startSlide: 4,
  // auto: 3000,
   continuous: false,
  // disableScroll: true,
  // stopPropagation: true,
  // callback: function(index, element) {},
  // transitionEnd: function(index, element) {}
});

// with jQuery
// window.mySwipe = $('#mySwipe').Swipe().data('Swipe');

</script>

<script>



var histcatexplong = [
                      {
                          "key": "Financial Insurance Services",
                          "values": [[2003, 12533],
                              [2004, 101909],
                              [2005, 121659],
                              [2006, 146890],
                              [2007, 195358],
                              [2008, 210127],
                              [2009, 239150],
                              [2010, 271261],
                              [2011, 295383],
                              [2012, 359576]]
                      },
                      {
                          "key": "Manufacturing",
                          "values": [[2003, 35595],
                              [2004, 95235],
                              [2005, 103666],
                              [2006, 107756],
                              [2007, 116483],
                              [2008, 105323],
                              [2009, 124835],
                              [2010, 133591],
                              [2011, 142141],
                              [2012, 128515]]
                      },
                      {
                          "key": "Wholesale & Retail Trade",
                          "values": [[2003, 39574],
                              [2004, 43286],
                              [2005, 54548],
                              [2006, 62917],
                              [2007, 77072],
                              [2008, 92952],
                              [2009, 99172],
                              [2010, 108722],
                              [2011, 118264],
                              [2012, 126821]]
                      },
                      {
                          "key": "Professional Administrative & Support Services",
                          "values": [[2003, 7760.3],
                              [2004, 8168.2],
                              [2005, 12533],
                              [2006, 13407],
                              [2007, 22605],
                              [2008, 35595],
                              [2009, 37668],
                              [2010, 35174],
                              [2011, 40579],
                              [2012, 39574]]
                      },
                      {
                          "key": "Transport & Storage",
                          "values": [[2003, 40579],
                              [2004, 13090],
                              [2005, 17652],
                              [2006, 23225],
                              [2007, 30525],
                              [2008, 36329],
                              [2009, 36661],
                              [2010, 36794],
                              [2011, 34254],
                              [2012, 37711]]
                      },
                       {
                          "key": "Real Estate Activities",
                          "values": [[2003, 35174],
                              [2004, 7883.6],
                              [2005, 6680.3],
                              [2006, 8197.7],
                              [2007, 12896],
                              [2008, 14698],
                              [2009, 17308],
                              [2010, 20083],
                              [2011, 24486],
                              [2012, 27091]]
                      },
                      {
                          "key": "Others",
                          "values": [[2003, 37668],
                              [2004, 150.8],
                              [2005, 421.8],
                              [2006, 980.7],
                              [2007, 2212],
                              [2008, 5159.3],
                              [2009, 7763.9],
                              [2010, 9542.4],
                              [2011, 11539],
                              [2012, 12248]]
                      },
                      {
                          "key": "Information & Communication",
                          "values": [[2003, 22605],
                              [2004, 3446.2],
                              [2005, 3692.6],
                              [2006, 3565.8],
                              [2007, 4885.5],
                              [2008, 5131.7],
                              [2009, 5901],
                              [2010, 5936.9],
                              [2011, 5337.3],
                              [2012, 7699.9]]
                      },
                      {
                          "key": "Accommodation & Food Services Activities",
                          "values": [[2003, 13407],
                              [2004, 2522.9],
                              [2005, 2043.9],
                              [2006, 2795.2],
                              [2007, 3012.7],
                              [2008, 3355.6],
                              [2009, 3486.7],
                              [2010, 3811.8],
                              [2011, 4311.7],
                              [2012, 4826.8]]
                      },
                      {
                          "key": "Construction",
                          "values": [[2003, 8168.2],
                              [2004, 1128],
                              [2005, 924.8],
                              [2006, 758.8],
                              [2007, 1517.8],
                              [2008, 1915.8],
                              [2009, 2754.4],
                              [2010, 1468.3],
                              [2011, 2613.8],
                              [2012, 2625.7]]
                      },
                      
                      
                      
                      
                     
                     
                      
                      
                  ];

        var colors = d3.scale.category20();
        keyColor = function (d, i) {
            return colors(d.key)
        };

        var chart;
        nv.addGraph(function () {
            chart = nv.models.stackedAreaChart()

                    .useInteractiveGuideline(true)
                    .x(function (d) {
                    	
                    	
                        return d[0]
                    })
                    .y(function (d) {
                        return d[1]
                    })
                    .color(keyColor)
                    // transition speed
                    .transitionDuration(300);

            //format gdp into 1 decimal place
            chart.yAxis
                    .tickFormat(d3.format(',.1f'));

            d3.select('#chart3')
                    .datum(histcatexplong)
                    .transition().duration(1000)
                    .call(chart)
                    .each('start', function () {
                        setTimeout(function () {
                            d3.selectAll('#chart3 *').each(function () {
                            	
                                console.log('start', this.__transition__, this)
                                if (this.__transition__)
                                    this.__transition__.duration = 1;
                            })
                        }, 0)
                    })

            nv.utils.windowResize(chart.update);
            /*
            d3.selectAll(".nv-point").on("click", function (e,i) {
            	alert(e.key);
            	
	    		
			}); */
			
			
			d3.select("#chart3").selectAll(".nv-point").style("pointer-events", "all").on("click", function(e,i) { 
				//alert(e);
				 document.getElementById('countryLabel').innerHTML = 'Distribution among countries';
				drawMiniGraph();

			}); 
			
			
			
			
            return chart;
        });

    </script>
    
    
</body>

</html>