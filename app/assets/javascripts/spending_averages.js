$(function () {
    $('#spending-averages').highcharts({
        chart: {
            type: 'bar'
        },
        title: {
            text: 'Your Spending Percentages'
        },
        subtitle: {
            text: 'Compared to National Averages'
        },
        xAxis: {
            categories: ['Housing', 'Transportation', 'Food', 'Phone', 'Misc', 'Savings'],
            title: {
                text: 'Categories'
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Percentage',
                align: 'high'
            },
            labels: {
                overflow: 'justify'
            }
        },
        tooltip: {
            valueSuffix: ' millions'
        },
        plotOptions: {
            bar: {
                dataLabels: {
                    enabled: true
                }
            }
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'top',
            x: -40,
            y: 80,
            floating: true,
            borderWidth: 1,
            backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
            shadow: true
        },
        credits: {
            enabled: false
        },
        series: [{
            name: 'Your spending',
            data: [27, 31, 35, 20, 5]
        }, {
            name: 'Average Spending',
            data: [35, 15, 7, 3, 30, 10]
        }]
    });
});