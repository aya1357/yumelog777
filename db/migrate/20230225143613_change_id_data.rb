class ChangeIdData < ActiveRecord::Migration[7.0]
  def change
    change_column :memos, :user_id, :bigint
    change_column :studies, :user_id, :bigint
  end
end
