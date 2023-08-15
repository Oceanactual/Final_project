class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :class
      t.integer :level
      t.string :race
      t.string :sub_race
      t.string :background
      t.integer :str_score
      t.integer :dex_score
      t.integer :con_score
      t.integer :int_score
      t.integer :wis_score
      t.integer :cha_score
      t.integer :total_hp
      t.integer :current_hp
      t.integer :gold

      t.timestamps
    end
  end
end
