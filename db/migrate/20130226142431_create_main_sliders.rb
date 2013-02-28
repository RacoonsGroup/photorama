class CreateMainSliders < ActiveRecord::Migration
  def change
    create_table :main_sliders do |t|
      t.references :photo

      t.timestamps
    end
    add_index :main_sliders, :photo_id
  end
end
