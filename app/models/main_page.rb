class MainPage < PageModule
  belongs_to :project
  has_one :main_page_attr, dependent: :destroy
end
