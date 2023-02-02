class AddColumnLogs < ActiveRecord::Migration[7.0]
  def up
    add_column :logs, :log_date, :date, null: false
  end
end
