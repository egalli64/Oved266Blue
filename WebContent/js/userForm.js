$(function() {
	$(".childNode").hide();

	$(".parentNode").click(function() {
		$(".childNode").css('top', $(this).scrollTop());
		$(".childNode").slideDown("Slow", function() {
			// Animation complete.
		});
	})

	$(".grandparentNode").click(function() {
		if ($("#exampleDropdownFormPassword1").is(":visible")) {

			$(".childNode").hide(function() {
			});

		}

	});
})
