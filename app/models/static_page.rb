class StaticPage < PageModule
  belongs_to :project
  has_one :static_page_attr, dependent: :destroy
end
