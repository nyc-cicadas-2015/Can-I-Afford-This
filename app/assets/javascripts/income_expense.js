$(document).ready(function(){
    $.ajax
})


$(function () {
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
            data: [2000]
        }, {
            name: 'Spending',
            data: [1000]
        }]
    });
});

