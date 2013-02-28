class CreateGalleryAttrs < ActiveRecord::Migration
  def change
    create_table :gallery_attrs do |t|
      t.references :gallery

      t.timestamps
    end
    add_index :gallery_attrs, :gallery_id
  end
end
