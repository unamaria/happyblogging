class Tag < ActiveRecord::Base
	has_and_belongs_to_many :blog_items
	
	validates :name, presence: true
end