/**
 * 
 */

$(function() {
//	var c = document.getElementsByClassName("rowOnMoorings");
	console.log('Jquery working!');
	
	//Reads if each row has a child with class "text-danger" related to unavailable
	//moorings, if true, it hides the cart
	let c = document.getElementsByClassName("rowOnMoorings");
	for (var i=0; i<c.length; i++) {
		//let a = $(c[i]).child();
		//console.log(c[i].getElementsByClassName("text-danger"));
		if(c[i].getElementsByClassName("text-danger").length != 0) {
			let a = c[i].getElementsByClassName("cartMooring");
			$(a).hide();
		}
	}
	
	//If the element with class="linkButton" is clicked, a scroll is executed
	//reaching the top of the page
	$(".linkBottom").click(function() {
		console.log("click on go to top");
		$(window).scrollTop(0);
	});
	
	//Changes the bottom message of pages "Go to top" colors when the mouse is over
	$(".linkBottom").mouseenter(function() {
		$(".linkBottom").attr("style","color: red;");
	}).mouseleave(function() {
		$(".linkBottom").attr("style","color: blue;");
	});
	
});







