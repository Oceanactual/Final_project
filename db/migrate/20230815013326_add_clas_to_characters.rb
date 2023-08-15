class AddClasToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :clas, :string
  end
end
