$(document).ready(function(){

	$(".guest-user").on ("click", function (e) {
		e.preventDefault();

		$("#user_email").val("rufus@example.com");
		$("#user_password").val("rrrrrrrr");
	});

	$(".guest-post").on ("click", function (e) {
		e.preventDefault();

		$("#title").val("Alice in Wonderland");

		var body = "'Well, then,' the Gryphon went on, 'if you don't know what to uglify is, you ARE a simpleton.'\r\n\r\nAlice did not feel encouraged to ask any more questions about it, so she turned to the Mock Turtle, and said 'What else had you to learn?'\r\n\r\n'Well, there was Mystery,' the Mock Turtle replied, counting off the subjects on his flappers, '—Mystery, ancient and modern, with Seaography: then Drawling—the Drawling-master was an old conger-eel, that used to come once a week: HE taught us Drawling, Stretching, and Fainting in Coils.'\r\n\r\n'What was THAT like?' said Alice.\r\n\r\n'Well, I can't show it you myself,' the Mock Turtle said: 'I'm too stiff. And the Gryphon never learnt it.'\r\n\r\n'Hadn't time,' said the Gryphon: 'I went to the Classics master, though. He was an old crab, HE was.'\r\n\r\n'I never went to him,' the Mock Turtle said with a sigh: 'he taught Laughing and Grief, they used to say.'"

		$("#body").val(body);
		$("#tags").val("books, quotes");
	});

});