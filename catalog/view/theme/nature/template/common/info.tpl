

<div id="copyright_info">	
	<div id="up_button_author">
		&copy;
	</div>
	<div id="copyright_links">	
	</div>
</div>
<script>
	$( document ).ready(function() {
		powered_oc = 'Copyright © TIENS 2016';
		if(document.getElementById('home_content')){
			author = '';
		}else{
			author = '';
		}
		document.getElementById("copyright_links").innerHTML = author+powered_oc;
	
		$( "#up_button_author" ).click(function() {
			$( "#copyright_links" ).slideToggle( "slow", function() {});
		});
	});
</script>