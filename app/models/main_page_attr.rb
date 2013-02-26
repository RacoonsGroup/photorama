class MainPageAttr < ActiveRecord::Base
  belongs_to :main_page
  attr_accessible :content, :gallery_toggle
end
