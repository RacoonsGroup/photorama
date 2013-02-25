class ColorScheme < ActiveRecord::Base
  attr_accessible :color1, :color2, :color3, :color4, :color5, :color6, :color7, :name
  has_many :projects
end
