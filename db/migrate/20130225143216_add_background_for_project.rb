class AddBackgroundForProject < ActiveRecord::Migration
  def change
    add_column :projects, :background_id, :integer
  end
end
