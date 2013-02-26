class AddIndexToSlugFieldPageModulesTable < ActiveRecord::Migration
  def change
    add_index :page_modules, :slug
  end
end
