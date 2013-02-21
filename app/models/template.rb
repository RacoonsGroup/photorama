class Template < ActiveRecord::Base
  attr_accessible :name, :layout_name, :thumbnail
  has_many :projects
end
