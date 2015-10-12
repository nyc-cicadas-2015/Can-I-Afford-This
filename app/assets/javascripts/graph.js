$.ajax({
  type: "GET",
  contentType: "application/json; charset=utf-8",
  url: 'data',
  dataType: 'json',
  success: function (data) {
    debugger
    draw(data);
  },
  error: function (result) {
    console.error("You have an error");
  }
});

function draw(data) {
  var color = d3.scale.category20b();
  var height = 420,
  barWidth = 20;

  var y = d3.scale.linear()
  .range([0, height])
  .domain([0, d3.max(data)]);

  var chart = d3.select("#graph")
  .attr("height", height)
  .attr("width", barWidth * data.length);

  var bar = chart.selectAll("g")
  .data(data)
  .enter().append("g")
  .attr("transform", function (d, i) {
  return "translate(0," + i * barWidth + ")";
});

bar.append("rect")
  .attr("widthL", y)
  .attr("width", barWidth - 1)
  .style("fill", function (d) {
  return color(d)
})

bar.append("text")
  .attr("y", function (d) {
  return y(d) - 10;
  })
  .attr("x", barWidth / 2)
  .attr("dx", ".35em")
  .style("fill", "white")
  .text(function (d) {
  return d;
  });
}