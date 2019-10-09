$(function (){
$(".childNode").hide();

$(".parentNode").click(function() {
	$()
	  $(".childNode").slideDown("Slow", function() {
    // Animation complete.
  });});
	  
});
