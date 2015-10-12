$.ajax({
  type: "GET",
  contentType: "application/json; charset=utf-8",
  url: 'data',
  dataType: 'json',
  success: function (data) {
    run([10, 200]);
  },
  error: function (result) {
    console.error("You have an error");
  }
});

function run(d){
  console.log(d)
  var svg = d3.select("svg");

  svg.selectAll("rect")
    .data(d)
    .transition()
    .duration(1500)
      .attr("x", function(d,i) { return i*90+10; })
      .attr("y", 0)
      .attr("width", 20)
      .attr("height", function(d,i) { return d; })
      .style("fill", "steelblue");
}
