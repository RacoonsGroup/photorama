# encoding=utf-8
class PageModule < ActiveRecord::Base
  belongs_to :project
  attr_accessible :anchor, :slug, :type, :project_id

  validates :slug, format: { with: /^[a-z0-9][a-z0-9\-]*[a-z0-9]$/,
                                  message: "в slug страницы не должно быть спец.символов" }
  validates :slug,
            presence: true,
            uniqueness: { scope: :project_id }

  validates :anchor,
            presence: true
  TYPES = [['Статическая страница', 'StaticPage'], ['Галлерея', 'Gallery']]
end
