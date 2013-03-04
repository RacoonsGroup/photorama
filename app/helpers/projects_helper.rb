module ProjectsHelper

  def link_to_fancy_photo(photo)
    link_to image_tag( photo.file.thumb.url, alt: photo.title, class: 'img-polaroid'),  photo.file.url, class: 'photos', rel: 'group1'
  end

end
