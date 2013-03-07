class AddLogoColumnToProjectTable < ActiveRecord::Migration
  def change
    add_column :projects, :logo, :string
  end
end
