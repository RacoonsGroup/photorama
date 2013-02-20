class CreateTemplatesTable < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.string :layout_name
      t.string :thumbnail

      t.timestamps
    end
  end
end
