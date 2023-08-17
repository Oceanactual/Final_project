class AddCharacterIdToCharacterProf < ActiveRecord::Migration[7.0]
  def change
    add_column :character_profs, :character_id, :integer
  end
end
