class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:confirmable

  devise :omniauthable, :omniauth_providers => [:facebook]

  has_attached_file :profile_pic, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\z/

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :upload_images, dependent: :destroy

  has_many :friendships
  has_many :friends, through: :friendships

   has_many :messages
  has_many :receivers, through: :messages

  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  has_many :inverse_friends, through: :inverse_friendships, source: :user

  def get_all_friends
  	friend_ids = self.friends.all.pluck(:id)

  	inverse_friend_ids = self.inverse_friends.all.pluck(:id)

  	all_friends = friend_ids + inverse_friend_ids

  	return User.where('id in (?)', all_friends)

  end

  def self.process_uri(uri)
    require 'open-uri'
    require 'open_uri_redirections'
    open(uri, :allow_redirections => :safe) do |r|
      r.base_uri.to_s
    end
  end

  def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name   # assuming the user model has a name
   
    user.profile_pic = process_uri(auth.info.image) # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    user.fb_access_token = auth.credentials.token
      user.skip_confirmation!
     

  end
  end

   def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.koala(auth)
   access_token = auth['token']
   facebook = Koala::Facebook::API.new(access_token)
   facebook.get_object("me?fields=name,picture")
 end

  

  
end
