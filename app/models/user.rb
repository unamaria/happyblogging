class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blog_items, dependent: :destroy
  has_one :flickr_detail, dependent: :destroy
  has_one :medium_detail, dependent: :destroy
  has_many :post_items, through: :blog_items, source: :item, source_type: "PostItem"
  has_many :flickr_items, through: :blog_items, source: :item, source_type: "FlickrItem"
  has_many :medium_items, through: :blog_items, source: :item, source_type: "MediumItem"
 
  validates :handle, presence: true, uniqueness: true
end
