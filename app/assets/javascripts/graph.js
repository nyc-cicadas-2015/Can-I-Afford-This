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
    .duration(1500)
      .attr("x", function(d,i) { return i*90+50; })
      .attr("y", 0)
      .attr("width", 20)
      .attr("height", function(d,i) { return d; })
      .style("fill", "steelblue");

}
