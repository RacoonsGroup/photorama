class Gallery < PageModule
  has_one :gallery_attr, dependent: :destroy
  has_many :albums
  #alias_attribute :attribute, :gallery_attr
end