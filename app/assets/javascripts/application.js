// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require react
//= require react_ujs
//= require components
//= require_tree .

$(document).ready(function(){
  $('body').on("click", "a#show_replies", function(event){
    event.preventDefault();
    selector = $(this).attr('href');
    $('li#' + selector + " ul").toggle();
  });

  $('body').on("click", ".keypoint-sort-tabs a", function(event){
    event.preventDefault();
    console.log($(this).css('background-color'));
    if($(this).css('background-color')=='rgb(255, 255, 255)')
         $(this).css('background-color', '#000');
    else {
         $(this).css('background-color', '#fff');
    }
    $.ajax({
      url: $(this).attr('href'),
      method: "get",
    })
    .done(function(response){
      $('.reviews-container').html(response);
    });
  });
});