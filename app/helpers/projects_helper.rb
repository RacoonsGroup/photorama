module ProjectsHelper

  def link_to_fancy_photo(photo)
    link_to image_tag( photo.file.thumb.url, alt: photo.title, class: 'img-polaroid'),  photo.file.url, class: 'photos', rel: 'shadowbox[group]'
  end

  def link_to_galleriffic_photo(photo)
    link_to image_tag( photo.file.thumb.url, alt: photo.title, class: 'span2'),  photo.file.url, class: 'thumb', name: photo.id, title: photo.title
  end

end
