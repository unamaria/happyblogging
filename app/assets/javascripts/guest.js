$(document).ready(function(){

	$(".guest-user").on ("click", function (e) {
		e.preventDefault();

		$("#user_email").val("dude@example.com");
		$("#user_password").val("thedudeabides");
	});

	$(".guest-post").on ("click", function (e) {
		e.preventDefault();

		$("#title").val("The Big Lebowski");

		var body = "Well, sir, it's this rug I had. It really tied the room together."

		$("#body").val(body);
		$("#tags").val("movies, quotes, the big lebowski");
	});

});