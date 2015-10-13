$(document).ready(function(){
    $.ajax({
        url: '/graph/net_savings_data',
        method: "get"
    }).done(function(data){
        makeChart(data);
    }).fail(function(error) {
        console.log("You fail: " + error);
    })

    var makeChart = function(data) {
        $('#container').highcharts({
            chart: {
                type: 'column'
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
})
