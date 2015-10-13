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
    $('#chart-container').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Savings vs Purchase price'
        },
        xAxis: {
            categories: ['Purchase', 'Savings']
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Total fruit consumption'
            },
            stackLabels: {
                enabled: true,
                style: {
                    fontWeight: 'bold',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
                }
            }
        },
        legend: {
            align: 'right',
            x: -30,
            verticalAlign: 'top',
            y: 25,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
            borderColor: '#CCC',
            borderWidth: 1,
            shadow: false
        },
        tooltip: {
            headerFormat: '<b>{point.x}</b><br/>',
            pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
        },
        plotOptions: {
            column: {
                stacking: 'normal',
                dataLabels: {
                    enabled: true,
                    color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                    style: {
                        textShadow: '0 0 3px black'
                    }
                }
            }
        },
        series: [{
            name: 'Savings',
            data: [data.savings]
        }, {
            name: 'Purchases',
            data: [data.purchases]
        }]
    });
};
})
