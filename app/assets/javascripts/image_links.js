// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/




function makeBig() {
  
  $(this).removeClass('thumbnail');
  $(this).addClass('large-image');
   
}

function makeSmall() {
  
  $(this).addClass('thumbnail');
  $(this).removeClass('large-image');
  

}


$(document).ready(function() {
  $(document).on('mouseenter', '.image-link-image',  makeBig);
  $(document).on('mouseleave', '.image-link-image',  makeSmall);

    $("#likebtn").click().attr("disabled", "disabled");


});


$(function() {
    $("#likebtn").click().attr("disabled", "disabled");
});

function disableFunction() {
    document.getElementById("btn1").disabled = 'true';
}
