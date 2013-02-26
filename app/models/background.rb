class Background < ActiveRecord::Base
  attr_accessible :background, :name
  mount_uploader :background, BgUploader
  has_many :projects
end
