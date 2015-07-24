
17.times do 
	u = User.new
	u.handle = Faker::Team.creature
	u.name = Faker::Name.name
	u.email = Faker::Internet.email
	u.password = 'testtest'
	u.save
end