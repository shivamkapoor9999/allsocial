class Post < ActiveRecord::Base
	validates :user, presence: true

	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :upload_images, dependent: :destroy
	has_many :likes, as: :likeable
end
