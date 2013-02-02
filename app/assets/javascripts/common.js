$(document).ready(function(){
	$(".item-round").hover(function(){
		$(this).find('.tooltip').fadeToggle('fast');
	});
	
	$("#proposeBtn").click(function(e){
		e.preventDefault();
		$(".submit-proposal").slideDown('fast');
		$('html, body').animate({ scrollTop: $('.submit-proposal').offset().top }, 'fast');
	});
});