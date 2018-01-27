class UploadImage < ActiveRecord::Base
	has_attached_file :uploaded_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :uploaded_image, content_type: /\Aimage\/.*\z/
  validates :user, presence: true
  validates :post, presence: true
  belongs_to :user
  belongs_to :post
  has_attached_file :image,
    :path => ":rails_root/public/images/:id/:filename",
    :url  => "/images/:id/:filename"

  do_not_validate_attachment_file_type :image



  def url
    return self.uploaded_image.url
  end

 
end
