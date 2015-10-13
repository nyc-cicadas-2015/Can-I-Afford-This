$(document).ready(function(){
    $.ajax({
        url: '/graph/savings_vs_purchase_data',
        method: "get"
    }).done(function(data){
        makeChart(data);
    }).fail(function(e){
        console.log("Failed:" + e);
    })

    var makeChart = function (data) {
        // First, let's make the colors transparent
        Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
            return Highcharts.Color(color)
                .setOpacity(0.5)
                .get('rgba');
            });

        $('#chart-container').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: 'Savings vs Purchase'
            },
            xAxis: {
                categories: ['Savings vs Purchase']
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Amount ($)'
                }
            },
            legend: {
                layout: 'vertical',
                backgroundColor: '#FFFFFF',
                align: 'left',
                verticalAlign: 'top',
                x: 100,
                y: 70,
                floating: true,
                shadow: true
            },
            tooltip: {
                shared: true,
                valuePrefix: '$'
            },
            plotOptions: {
                column: {
                    grouping: false,
                    shadow: false
                }
            },
            series: [{
                name: 'Purchases',
                data: [data.purchases],
                pointPadding: 0
            },
            {
                name: 'Savings',
                data: [data.savings],
                pointPadding: 0.015
            }]
        });
    };
})
