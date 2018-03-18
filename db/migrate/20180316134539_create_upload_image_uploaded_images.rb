class CreateUploadImageUploadedImages < ActiveRecord::Migration
  def self.up
    create_table :uploaded_images do |t|
      t.integer    :upload_image_id
      t.string     :style
      t.binary     :file_contents
    end
  end

  def self.down
    drop_table :uploaded_images
  end
end
