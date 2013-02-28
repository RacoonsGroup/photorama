class Photo < ActiveRecord::Base
  belongs_to :album
  attr_accessible :desc, :file, :title
end
