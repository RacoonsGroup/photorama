class AddTemplateIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :template_id, :integer
  end
end
