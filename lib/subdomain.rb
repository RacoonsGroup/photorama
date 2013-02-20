class Slug
  def self.matches?(request)
    request.slug.present? && request.slug != 'www'
  end
end