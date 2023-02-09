class CreateHabitLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :habit_logs do |t|
      t.references :habit, null: false, foreign_key: true
      t.references :log, null: false, foreign_key: true

      t.timestamps
    end
  end
end
