$(document).ready(function(){
    $('#canipurchase').on('click', function(e){
        e.preventDefault();
        var url = $(e.target).attr('href')
        $.ajax({
            url: url,
            method: 'GET'
        }).done(function(data){
            $('#caniafford-results').html(data);
            $('#result-copy').show();
        }).fail(function(){
            console.error("Error, something went wrong.");
        });
    });
});