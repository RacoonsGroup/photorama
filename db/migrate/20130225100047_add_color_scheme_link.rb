class AddColorSchemeLink < ActiveRecord::Migration
  def change
    add_column :projects, :color_scheme_id, :integer
  end
end
