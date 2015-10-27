$(document).ready(function(){
  $('body').on("click", "a#show_replies", function(event){
    event.preventDefault();
    selector = $(this).attr('href');
    $('li#' + selector + " ul").toggle();
  });
});