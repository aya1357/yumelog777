class ChangeBodyColumnInMemos < ActiveRecord::Migration[7.0]
  def change
    change_column :memos, :body, :text, null: false
  end
end
