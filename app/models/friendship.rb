class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  validates :user, presence: true
  validates :friend, presence: true
end
