
# 5.times do 
# 	u = User.new
# 	u.handle = Faker::Team.creature
# 	u.name = Faker::Name.name
# 	u.email = Faker::Internet.email
# 	u.password = 'testtest'
# 	u.save

	# 3.times do
	# 	u.posts << Post.new(title: Faker::Lorem.sentence, 
	# 		body: Faker::Lorem.paragraph(7, false, 4))
	# end
# end

dude = User.create!(
	handle: 	'bear',
	name: 		'Big Lebowski',
	email: 		'dude@example.com',
	password: 'thedudeabides')

40.times do
	post = PostItem.new(
			title: Faker::Lorem.sentence, 
			body: Faker::Lorem.paragraph(7, false, 4))
	dude.post_items << post
	post.blog_item = BlogItem.create!(user_id: dude.id, item_type: 'PostItem')
end
