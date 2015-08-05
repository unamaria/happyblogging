$(document).ready(function(){

 function removeAlert(){
   $(".notice").fadeOut(1000);
 }

 window.setTimeout(removeAlert,800);

	$(".sync-data").on("click", function() {
		$("div#loader").toggle();
		$(".translucent").css("opacity",".2");
	});

});