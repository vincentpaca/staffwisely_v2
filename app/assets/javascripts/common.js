$(document).ready(function(){
	
	
	$("#proposeBtn").click(function(e){
		e.preventDefault(); 
		$(".submit-proposal").slideDown('fast');
		$('html, body').animate({ scrollTop: $('.submit-proposal').offset().top }, 'fast');
	});
	$("#hiringLink").click(function(){
		$(this).addClass('active');
		$(this).removeClass('inactive');
		$("#projectsLink").addClass('inactive');
		$("#hiring").show();
		$("#projects").hide();
	});
	$("#projectsLink").click(function(){
		$(this).addClass('active');
		$(this).removeClass('inactive');
		$("#hiringLink").addClass('inactive');
		$("#projects").show();
		$("#hiring").hide();
	});
});