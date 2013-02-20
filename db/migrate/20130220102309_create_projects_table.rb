class CreateProjectsTable < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :slug
      t.string :title
      t.references :user

      t.timestamps
    end

    add_index :projects, :user_id
  end
end
