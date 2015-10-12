$.ajax({
  type: "GET",
  contentType: "application/json; charset=utf-8",
  url: 'data',
  dataType: 'json',
  success: function (data) {
    run(data);
  },
  error: function (result) {
    console.error("You have an error");
  }
});

function run(d){
  console.log(d)
  window.svg = d3.select("svg");

  svg.selectAll("rect")
    .data(d)
    .transition()
    .duration(1500)
      .attr("x", function(d,i) { return i*90+10; })
      .attr("y", function(d,i) { return 200 - d/10; })
      .attr("width", 20)
      .attr("height", function(d,i) { return d / 10; })
      .style("fill", "steelblue")

}

