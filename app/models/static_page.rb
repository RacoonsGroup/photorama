class StaticPage < PageModule
  has_one :static_page_attr, dependent: :destroy
end
