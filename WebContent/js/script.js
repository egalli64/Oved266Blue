$(function() {

	// check number
	$('button').click(function() {
		$('p').remove();
		let text = $('#phone').val().trim();
        if(text.match('^[0-9]+$')){
 		$('<p>Invalid phone number</p>').css({color : 'red'}).prependTo('#ph');
        }
	});
});