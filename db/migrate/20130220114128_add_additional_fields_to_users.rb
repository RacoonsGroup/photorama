class AddAdditionalFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :telephone, :string
    add_column :users, :city, :string
  end
end
