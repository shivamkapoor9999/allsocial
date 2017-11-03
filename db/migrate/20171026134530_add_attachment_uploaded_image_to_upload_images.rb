class AddAttachmentUploadedImageToUploadImages < ActiveRecord::Migration
  def self.up
    change_table :upload_images do |t|
      t.attachment :uploaded_image
    end
  end

  def self.down
    remove_attachment :upload_images, :uploaded_image
  end
end
