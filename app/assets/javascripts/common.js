$(document).ready(function(){
	$(".item-round").hover(function(){
		$(this).find('.tooltip').fadeToggle('fast');
	});
	
	$("#proposeBtn").click(function(e){
		e.preventDefault();
		$(".submit-proposal").slideDown('fast');
		$('html, body').animate({ scrollTop: $('.submit-proposal').offset().top }, 'fast');
	});
	$("#projectsLink").click(function(){
		$("#projects").show();
		$("#hire").hide();

		$(this).addClass('active');
		$("#hireLink").removeClass('active');
	});
	$("#hireLink").click(function(){
		$("#projects").hide();
		$("#hire").show();

		$(this).addClass('active');
		$("#projectsLink").removeClass('active');
	});
});