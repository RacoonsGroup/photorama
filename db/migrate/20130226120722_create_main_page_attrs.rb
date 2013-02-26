class CreateMainPageAttrs < ActiveRecord::Migration
  def change
    create_table :main_page_attrs do |t|
      t.text :content
      t.boolean :gallery_toggle
      t.references :main_page

      t.timestamps
    end
    add_index :main_page_attrs, :main_page_id
  end
end
