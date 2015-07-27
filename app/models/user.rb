class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :blog_items, dependent: :destroy
  #has_many :items, through: :blog_items, source_type: "Item"
  validates :handle, presence: true, uniqueness: true
end
