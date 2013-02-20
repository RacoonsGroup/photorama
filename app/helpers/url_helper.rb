module UrlHelper
  def with_slug(slug)
    slug = (slug || "")
    slug += "." unless slug.empty?
    [slug, request.domain, request.port_string].join
  end
end