class RemoveCharacterFromStudies < ActiveRecord::Migration[7.0]
  def change
    remove_column :studies, :character , :string
    remove_column :studies, :character_message , :string
  end
end
