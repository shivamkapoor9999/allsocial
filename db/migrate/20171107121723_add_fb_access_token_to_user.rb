class AddFbAccessTokenToUser < ActiveRecord::Migration
  def change
  	add_column :users, :fb_access_token, :text
  end
end
