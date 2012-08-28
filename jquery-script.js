debug = false;

//Hide all main column divs.
$(document).ready(function() {
	$('div#about-wrapper').siblings().hide();
});

if (debug){
	$(document).ready(function() {
		$('body').append('<div class="box" id="debug"> </div>');
		$('#debug').append("First!<br>");
	});
}

$(document).ready(function() {
	$('div#menu> div').hide();
	
	$('.menuheader').each(function(){
		var headerId = $(this).attr('id');
		var headerName = headerId.replace("menu","");
		
		if (debug){
			$('#debug').prepend('Header found: ' + headerName + '<br>');
			$('#debug').prepend('Function: ' + 'div#'+ headerName + '-wrapper' + '.hide()<br>');
		}

		$('div#'+ headerName + '-wrapper> div').hide();
		$('div#'+ headerName + '-wrapper> h2').click(function() {
			$(this).next('div').slideToggle('250').siblings('div:visible').slideUp('250');
		});
		
		$(this).click(function() {
			$(this).next('div').slideToggle('150').siblings('div:visible').slideUp('150');
			$('div#'+ headerName + '-wrapper').slideDown('250').siblings().slideUp('250');
		});
	});
});

$(document).ready(function() {
	$('.menuitem').each(function(){
		var itemId = $(this).attr('id');
		var itemName = itemId.replace("menu","");
		if (debug){
			$('#debug').prepend('Menu item found: ' + itemName + '<br>');
		}
		$('p#menu' + itemName).click(function() {
			$('h2#' + itemName).next('div').slideToggle('250')
			.siblings('div:visible').slideUp('250');
		});
	});
	
});