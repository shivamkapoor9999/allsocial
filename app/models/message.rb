class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :receiver, class_name: 'User'
  validates :user, presence: true
  validates :receiver, presence: true
end
