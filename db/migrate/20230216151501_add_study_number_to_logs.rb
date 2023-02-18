class AddStudyNumberToLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :logs, :study_number, :integer, null: false
  end
end
