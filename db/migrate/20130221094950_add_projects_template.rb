class AddProjectsTemplate < ActiveRecord::Migration
  def change
    add_column :projects, :template, :string
  end
end
