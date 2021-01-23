$(document).ready(function() {
	$( window ).scroll(function() {
		showBadges();
		$( window ).trigger("resize");
		
		$(".ocstore-badge").unbind("click");
		$(".ocstore-badge-item").attr("onclick", "");
		$(".ocstore-badge-item").css("z-index", 2); 
		$(".ocstore-badge-item span").css("z-index", 3);
	});
});
