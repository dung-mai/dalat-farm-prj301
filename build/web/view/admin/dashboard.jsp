<%-- 
    Document   : admin-product
    Created on : Jun 26, 2022, 9:09:58 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Quản lý doanh thu</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/bootstrap.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/responsive.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/ui.css'>
        <link rel='stylesheet' type='text/css' media='screen' href='${pageContext.request.contextPath}/css/admin.css'>
        <script src="https://kit.fontawesome.com/cc5cf43e7a.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>

    </head>

    <body>
        <style>
            .row{
                margin-bottom: 20px;
            }

            .col-lg-8 {
                background: white;
                padding: 5px;
            }

            .col-lg-6 canvas {
                background: white;
            }

            .content-header{
                justify-content: center;
                background: #ffffff;
            }
            .row-small {
                margin: 15px;
                margin-bottom: 5px;
            }

        </style>
        <c:set var="context" value="${pageContext.request.contextPath}" />
        <div class="page-wrapper">
            <!--ASIDE-->
            <jsp:include page="ASIDE.jsp"></jsp:include>
                <!--ASIDE-->

                <main class="main-admin-page">
                    <!--HEADER-->
                <jsp:include page="header.jsp"></jsp:include>
                    <!--HEADER-->

                    <section class="content-main">
                        <div class="content-header">
                            <h2 class="content-title" style="text-align: center">Tổng quan doanh thu bán hàng</h2>
                        </div>
                        <div class="content-body">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <canvas id="myChart" style="width:100%;"></canvas>
                                    </div>
                                    <div class="col-lg-6">
                                        <canvas id="myChart1" style="width:100%"></canvas>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-2">
                                    </div>
                                    <div class="col-lg-8">
                                        <div class="row row-small">
                                            <div class="col-lg-6">
                                                <h3>Tổng doanh thu</h3>
                                            </div>
                                            <div class="col-lg-5 text-end">
                                                <h4 class="text-primary bold">${requestScope.doanhthu/1000}00 đ</h4>
                                            </div>
                                        </div>
                                        <canvas id="chart2" style="width:100%"></canvas>
                                    </div>
                                </div>

                                <script>
                                    //            Chart.register(ChartDataLabels);
                                    var statusList = new Array();
                                    var saleList = new Array();
                                    var totalList = new Array();
                                <c:forEach items="${requestScope.statusList}" var="i">
                                    statusList.push(${i});
                                </c:forEach>
                                <c:forEach items="${requestScope.sales}" var="s">
                                    saleList.push(${s});
                                </c:forEach>
                                <c:forEach items="${requestScope.totals}" var="t">
                                    totalList.push(${t});
                                </c:forEach>
                                    var d = new Date();
                                    d.setDate(d.getDate() - 7);
                                    var listDate = Array();
                                    for (let i = 6; i >= 0; i--) {
                                        d.setDate(d.getDate() + 1);
                                        listDate.push(d.getDate() + '/' + (d.getMonth() + 1));
                                    }


                                    const data = {
                                        labels: [
                                            'Chờ xác nhận',
                                            'Đang giao',
                                            'Thành công',
                                            'Hủy'
                                        ],
                                        datasets: [{
                                                label: 'My First Dataset',
                                                data: statusList,
                                                backgroundColor: [
                                                    'rgb(255, 205, 86)',
                                                    '#269bfe',
                                                    '#87eb98',
                                                    'rgb(255, 99, 132)'
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

                                    var xValues = listDate;
                                    var yValues = totalList;
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
                                            title: {
                                                display: true,
                                                text: "Doanh thu cửa hàng theo ngày"
                                            },
                                            scales: {
//                                                yAxes: [{ticks: {min: 6, max: 16}}],
                                            }
                                        }
                                    });

                                    ///CHART 3
                                    var chartData = {
                                        labels: listDate,
                                        datasets: [
                                            {
                                                backgroundColor: "#c1b8f1",
                                                borderColor: "rgba(0,0,255,0.1)",
                                                fillColor: "green",
                                                strokeColor: "rgb(75, 192, 192)",
                                                data: saleList
                                            }
                                        ]
                                    };
                                    var opt = {
                                        title: {
                                            display: true,
                                            text: "Số lượng đơn hàng theo ngày"
                                        },
                                        animation: {
                                            onComplete: function () {
                                                var chartInstance = this.chart,
                                                        ctx = chartInstance.ctx;
                                                ctx.font = Chart.helpers.fontString(Chart.defaults.global.defaultFontSize, 20, Chart.defaults.global.defaultFontFamily);
                                                ctx.textAlign = 'center';
                                                ctx.textBaseline = 'bottom';
                                                this.data.datasets.forEach(function (dataset, i) {
                                                    var meta = chartInstance.controller.getDatasetMeta(i);
                                                    meta.data.forEach(function (bar, index) {
                                                        var data = dataset.data[index];
                                                        ctx.fillText(data, bar._model.x, bar._model.y - 7);
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
                        </div>
                    </div>
                </section>
            </main>
        </div>
        <script src="${context}/js/bootstrap.bundle.min.js" type="text/javascript"></script>
        <script src="${context}/js/jquery-3.5.0.min.js" type="text/javascript"></script>
    </body>
</html>
