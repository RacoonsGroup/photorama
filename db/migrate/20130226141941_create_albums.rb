class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.string :desc
      t.integer :order
      t.references :gallery_attr

      t.timestamps
    end
    add_index :albums, :gallery_attr_id
  end
end
