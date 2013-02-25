# encoding=utf-8
class PageModule < ActiveRecord::Base
  belongs_to :project
  attr_accessible :anchor, :slug, :type, :project_id

  TYPES = [['Статическая страница', 'StaticPage']]
end
