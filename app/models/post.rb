class Post < ActiveRecord::Base
	belongs_to :author, classname: 'User'
end