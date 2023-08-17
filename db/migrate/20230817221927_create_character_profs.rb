class CreateCharacterProfs < ActiveRecord::Migration[7.0]
  def change
    create_table :character_profs do |t|
      t.boolean :str_save
      t.boolean :dex_save
      t.boolean :con_save
      t.boolean :int_save
      t.boolean :wis_save
      t.string :cha_save_boolean
      t.boolean :athletics
      t.boolean :acrobatics
      t.boolean :sleight_of_hand
      t.boolean :stealth
      t.boolean :arcana
      t.boolean :history
      t.boolean :investigation
      t.boolean :nature
      t.boolean :religion
      t.boolean :animal_handling
      t.boolean :insight
      t.boolean :medicine
      t.boolean :perception
      t.boolean :survival
      t.boolean :deception
      t.boolean :intimidation
      t.boolean :persuasion
      t.boolean :performance

      t.timestamps
    end
  end
end
