class CreatePageModules < ActiveRecord::Migration
  def change
    create_table :page_modules do |t|
      t.string :anchor
      t.string :slug
      t.references :project
      t.string :type

      t.timestamps
    end
    add_index :page_modules, :project_id
  end
end
