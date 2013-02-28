class GalleryAttr < ActiveRecord::Base
  belongs_to :gallery
  attr_accessible :gallery_id
  has_many :albums
end
