/**
 * 
 */

$(function() {
//	var c = document.getElementsByClassName("rowOnMoorings");
	console.log('Jquery working!');
	
	let c = document.getElementsByClassName("rowOnMoorings");
	
	for (var i=0; i<c.length; i++) {
		//let a = $(c[i]).child();
		console.log(c[i].getElementsByClassName("text-danger"));
		if(c[i].getElementsByClassName("text-danger").length != 0) {
			let a = c[i].getElementsByClassName("cartMooring");
			$(a).hide();		
		}
	}
});







