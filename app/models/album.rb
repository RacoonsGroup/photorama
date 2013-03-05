class Album < ActiveRecord::Base
  has_many :photos
  belongs_to :gallery_attr
  attr_accessible :desc, :order, :title, :gallery_type
end
