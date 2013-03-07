class Gallery < PageModule
  has_one :gallery_attr, dependent: :destroy
  has_many :albums
  #alias_attribute :attribute, :gallery_attr

  validate :gallery_creating_count, :on => :create

  def gallery_creating_count
    if self.project.page_modules.where(type: 'Gallery').count >= 1
      errors.add(:base, "Exceeded thing limit")
    end
  end
end