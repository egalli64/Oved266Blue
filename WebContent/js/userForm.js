$(function() {
	$(".childNode").hide();

	$(".parentNode").click(function() {
		$(".childNode").css('top', $(this).scrollTop());
		$(".childNode").slideDown("Slow", function() {
			// Animation complete.
		});
	})

	$(".grandparentNode").click(function() {
		if ($("#exampleDropdownFormEmail2").is(":visible")) {

			$(".childNodeAdm").hide(function() {
			});
		}

	});
})
