class ChangeUserIdToIntegerInLogs < ActiveRecord::Migration[7.0]
  def change
    change_column :logs, :user_id, :integer
  end
end
