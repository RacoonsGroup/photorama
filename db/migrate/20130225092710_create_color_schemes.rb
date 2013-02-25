class CreateColorSchemes < ActiveRecord::Migration
  def change
    create_table :color_schemes do |t|
      t.string :name
      t.string :color1
      t.string :color2
      t.string :color3
      t.string :color4
      t.string :color5
      t.string :color6
      t.string :color7

      t.timestamps
    end
  end
end
