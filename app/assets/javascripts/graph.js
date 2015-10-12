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

function run(data){
  var svg = d3.select("svg");

  svg.selectAll("rect")
    .data(data)
    .transition()
    .duration(1500)  // 1.5 second
      .attr("x", 0)
      .attr("y", function(d,i) { return i*90+50; })
      .attr("width", function(d,i) { return d; })
      .attr("height", 20)
      .style("fill", "steelblue");

}
