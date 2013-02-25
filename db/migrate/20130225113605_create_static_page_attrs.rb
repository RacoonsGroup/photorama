class CreateStaticPageAttrs < ActiveRecord::Migration
  def change
    create_table :static_page_attrs do |t|
      t.text :content
      t.references :static_page

      t.timestamps
    end
    add_index :static_page_attrs, :static_page_id
  end
end
