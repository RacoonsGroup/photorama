module ProjectsHelper

  def link_to_photo(photo)
    link_to image_tag( photo.file.thumb.url, alt: photo.title, class: 'img-polaroid'),  page_module_album_photo_path( page_module_id: params[:page_module_id], album_id: params[:id], id: photo.id )
  end

end
