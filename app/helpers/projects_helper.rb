module ProjectsHelper

  def link_to_photo(photo)
    link_to image_tag( photo.file.thumb.url, alt: photo.title, class: 'img-polaroid', rel: 'group1'),  photo.file.url, class: 'photos'
  end

end
