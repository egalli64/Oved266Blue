$(function() {
	// check number
	$('button').click(function() {
		$('p').remove();
		let phone_num = $('#phone').val().trim();
		const regex = /^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/; //regex useful to check the phone number
        if(!regex.test(phone_num)){
 		$('<p>Invalid phone number</p>').css({color : 'red'}).prependTo('#ph');
 		event.preventDefault();
      }
	});
	// check email
	
});