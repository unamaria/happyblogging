dude = User.create!(
	handle: 	'dude',
	name: 		'Jeffrey Lebowski',
	email: 		'dude@example.com',
	password: 'thedudeabides')

# 40.times do
# 	post = PostItem.new(
# 			title: Faker::Lorem.sentence, 
# 			body: Faker::Lorem.paragraph(7, false, 4))
# 	dude.post_items << post
# 	post.blog_item = BlogItem.create!(user_id: dude.id, item_type: 'PostItem')
# end
