<%-- 
    Document   : newjsp
    Created on : Jul 5, 2022, 10:14:43 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>  
<html>  
    <head>  
        <title>THI</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0/dist/chartjs-plugin-datalabels.min.js"></script>

    </head>
    <body>
        <canvas id="myChart" style="width:100%;max-width:600px"></canvas>
        <canvas id="chart2" style="width:100%;max-width:600px"></canvas>
        <canvas id="myChart1" height="300" width="500"></canvas>
        <script>
//            Chart.register(ChartDataLabels);

            const data = {
                labels: [
                    'Green',
                    'Red',
                    'Yellow'
                ],
                datasets: [{
                        label: 'My First Dataset',
                        data: [300, 50, 100],
                        backgroundColor: [
                            '#87d067',
                            'rgb(255, 99, 132)',
                            'rgb(255, 205, 86)'
                        ],
                        hoverOffset: 4
                    }]
            };
            new Chart("myChart", {
                type: "doughnut",
                data: data,
                options: {
                    title: {
                        display: true,
                        text: "Số lượng đơn hàng theo trạng thái"
                    },
                    legend: {display: true},
                    plugins: {
                        datalabels: {
                            anchor: 'end',
                            align: 'top',
                            formatter: Math.round,
                            font: {
                                weight: 'bold',
                                size: 16
                            }
                        }
                    }
                }

            });

            var xValues = [50, 60, 70, 80, 90, 100, 110, 120, 130, 140, 150];
            var yValues = [7, 8, 8, 9, 9, 9, 10, 11, 14, 14, 15];

            new Chart("chart2", {
                type: "line",
                data: {
                    labels: xValues,
                    datasets: [{
                            fill: false,
                            lineTension: 0,
                            backgroundColor: "rgba(0,0,255,1.0)",
                            borderColor: "rgba(0,0,255,0.1)",
                            data: yValues
                        }]
                },
                options: {
                    legend: {display: false},
                    scales: {
                        yAxes: [{ticks: {min: 6, max: 16}}],
                    },
                    onAnimationComplete: function () {

                        var ctx = this.chart.ctx;
                        ctx.font = this.scale.font;
                        ctx.fillStyle = this.scale.textColor
                        ctx.textAlign = "center";
                        ctx.textBaseline = "bottom";

                        this.datasets.forEach(function (dataset) {
                            dataset.points.forEach(function (points) {
                                ctx.fillText(points.value, points.x, points.y - 10);
                            });
                        })
                    }
                }
            });
            
            
            var chartData = {
                labels: ["January", "February", "March", "April", "May", "June"],
                datasets: [
                    {
                        fillColor: "#79D1CF",
                        strokeColor: "#79D1CF",
                        data: [60, 80, 81, 56, 55, 40]
                    }
                ]
            };

            var opt = {
                events: false,
                tooltips: {
                    enabled: false
                },
                hover: {
                    animationDuration: 0
                },
                animation: {
                    duration: 1,
                    onComplete: function () {
                        var chartInstance = this.chart,
                                ctx = chartInstance.ctx;
                        ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, Chart.defaults.global.defaultFontStyle, Chart.defaults.global.defaultFontFamily);
                        ctx.textAlign = 'center';
                        ctx.textBaseline = 'bottom';

                        this.data.datasets.forEach(function (dataset, i) {
                            var meta = chartInstance.controller.getDatasetMeta(i);
                            meta.data.forEach(function (bar, index) {
                                var data = dataset.data[index];
                                ctx.fillText(data, bar._model.x, bar._model.y - 5);
                            });
                        });
                    }
                }
            };
            var ctx = document.getElementById("myChart1"),
                    myLineChart = new Chart(ctx, {
                        type: 'bar',
                        data: chartData,
                        options: opt
                    });
        </script>

        x
    </body>  
</html>  
