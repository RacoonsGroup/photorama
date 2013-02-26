class AddDeletedAndDeletedAtFieldsFromPageModules < ActiveRecord::Migration
  def change
    add_column :page_modules, :deleted, :boolean, default: false
    add_column :page_modules, :deleted_at, :datetime
  end
end
