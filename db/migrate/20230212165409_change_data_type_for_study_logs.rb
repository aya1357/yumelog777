class ChangeDataTypeForStudyLogs < ActiveRecord::Migration[7.0]
  def change
    change_column :study_logs, :study_id, :integer
    change_column :study_logs, :log_id, :integer
  end
end
