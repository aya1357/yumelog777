class CreateStudyLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :study_logs do |t|
      t.references :study, null: false, foreign_key: true
      t.references :log, null: false, foreign_key: true

      t.timestamps
    end
  end
end
