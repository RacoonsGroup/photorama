class Template < ActiveRecord::Base
  attr_accessible :name, :layout_name, :thumbnail
  mount_uploader :thumbnail, TemplateUploader
  has_many :projects
end
