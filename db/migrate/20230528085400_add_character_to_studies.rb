class AddCharacterToStudies < ActiveRecord::Migration[7.0]
  def change
    add_column :studies, :character , :string
    add_column :studies, :character_message , :string
  end
end
