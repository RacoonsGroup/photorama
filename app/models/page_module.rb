class PageModule < ActiveRecord::Base
  belongs_to :project
  attr_accessible :anchor, :slug, :type
end
