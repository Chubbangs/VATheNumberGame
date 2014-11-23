<meta charset="utf-8">

<link href="nv.d3.css" rel="stylesheet" type="text/css">

<style>

    body {
        overflow-y:scroll;
    }

    text {
        font: 12px sans-serif;
    }

    #chart3, #chart2 {
        height: 500px;
        width:90%;
        margin-right:auto;
        margin-left:auto;
    }

</style>
<body class='with-3d-shadow with-transitions'>

    <div>
        <svg id="chart3"></svg>
    </div>

    <script src="js/d3.v3.js"></script>
    <script src="js/nv.d3.js"></script>
    <script src="js/utils.js"></script>
    <script src="js/axis.js"></script>
    <script src="js/tooltip.js"></script>
    <script src="js/interactiveLayer.js"></script>
    <script src="js/stackedAreaChart.js"></script>
    <script>



        var histcatexplong = [
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

            return chart;
        });

    </script>
