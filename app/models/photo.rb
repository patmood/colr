class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :album

  mount_uploader :url, ImageUploader

  def self.upload_image

  end
end
