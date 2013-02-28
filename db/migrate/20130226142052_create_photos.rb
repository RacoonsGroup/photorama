class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :desc
      t.references :album
      t.string :file
      t.boolean :album_wallpaper, :default => false

      t.timestamps
    end
    add_index :photos, :album_id
    add_index :photos, :album_wallpaper
  end
end
