namespace :hb do
    desc "Fetch new external data"
    task :sync => :environment do
    	users = User.all
    	users.each do |user|
    		if user.medium_detail
    			MediumContentService.items(user)
    		end
    		if user.flickr_detail
    			FlickrContentService.items(user)
    		end
    	end
    end
end
