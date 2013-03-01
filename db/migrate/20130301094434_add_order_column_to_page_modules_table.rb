class AddOrderColumnToPageModulesTable < ActiveRecord::Migration
  def change
    add_column :page_modules, :order, :integer
  end
end
