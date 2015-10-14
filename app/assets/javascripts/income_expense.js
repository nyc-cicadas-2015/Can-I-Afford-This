$(document).ready(function(){
    $.ajax({
        url: '/graph/net_savings_data',
        method: "get"
    }).done(function(data){
        makeChart(data);
        pieChart(data)
    }).fail(function(error) {
        console.log("You fail: " + error);
    })

    var makeChart = function(data) {
        $('#container').highcharts({
            chart: {
                type: 'column'
            },
            credits: {
                enabled: false
            },
            title: {
                text: 'Monthly Income vs Spending'
            },
            xAxis: {
                categories: ['Income', 'Spending']
            },
            yAxis: {
                title: {
                    text: 'US Dollars'
                }
            },
            series: [{
                name: 'Income',
                data: [data.income]
            }, {
                name: 'Spending',
                data: [data.expenses]
            }]
        });
    };

    var pieChart = function(data) {
        $('#pie-container').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: 'Breakdown of your monthly expenses'
            },
            credits: {
                enabled: false
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                        }
                    }
                }
            },
            series: [{
                name: "Expense Type",
                colorByPoint: true,
                data: [{
                    name: "Housing",
                    y: data.percentages.Housing
                }, {
                    name: "Transportation",
                    y: data.percentages.Transportation
                }, {
                    name: "Food",
                    y: data.percentages.Food
                }, {
                    name: "Phone",
                    y: data.percentages.Phone
                }, {
                    name: "Misc",
                    y: data.percentages.Misc
                }, {
                    name: "Surplus",
                    y: ((data.expenses/data.income) * 100)gi
                }]
            }]
        });
    };
})
