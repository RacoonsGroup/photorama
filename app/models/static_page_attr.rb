class StaticPageAttr < ActiveRecord::Base
  belongs_to :static_page
  attr_accessible :content
end
