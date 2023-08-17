class AddChrSaveToCharacterProf < ActiveRecord::Migration[7.0]
  def change
    add_column :character_profs, :chr_save, :boolean
  end
end
