class Photo < ActiveRecord::Base
  mount_uploader :file, PhotoUploader
  belongs_to :album
  attr_accessible :desc, :file, :title
end
