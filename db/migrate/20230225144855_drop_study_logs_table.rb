class DropStudyLogsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :study_logs
  end
end
