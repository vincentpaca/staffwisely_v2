$(document).ready(function(){
	$(".item-round").hover(function(){
		$(this).find('.tooltip').fadeToggle('fast');
	});
});