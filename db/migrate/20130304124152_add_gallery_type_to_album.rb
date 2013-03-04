class AddGalleryTypeToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :gallery_type, :string
	Album.update_all(gallery_type: 'fancybox2')
  end
end

