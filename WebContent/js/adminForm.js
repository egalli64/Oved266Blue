$(function() {
	$(".childNodeAdm").hide();

	$(".parentNodeAdm").click(function() {
		$(".childNodeAdm").css('top', $(this).scrollTop());
		$(".childNodeAdm").slideDown("Slow", function() {
			// Animation complete.
		});
	})

	$(".grandparentNodeAdm").click(function() {
		if ($("#exampleDropdownFormEmail1").is(":visible")) {

			$(".childNode").hide(function() {
			});

		}

	});
})
