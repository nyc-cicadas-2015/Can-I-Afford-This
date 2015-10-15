$(document).ready(function(){
    $('.canipurchase').on('click', function(e){
        e.preventDefault();
        //remove global variable in refactor
        this_div_id = $(this).attr("href").substring(11)
        var url = $(e.target).attr('href')
        $.ajax({
            url: url,
            method: 'GET'
        }).done(function(data){
          // debugger
            $('#caniafford-results-' + this_div_id).append(data);
        }).fail(function(){
            console.error("Error, something went wrong.");
        });
    });
});