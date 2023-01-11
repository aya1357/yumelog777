class CreateHabits < ActiveRecord::Migration[7.0]
  def change
    create_table :habits do |t|
      t.string :title, null: false
      t.date :start_day, null: false
      t.integer :day_of_week, null: false, default: 0
      t.integer :habit_type, null: false, default: 0
      t.integer :total_number, null: false
      t.integer :start_number, null: false
      t.integer :end_number, null: false
      t.integer :target_number, null: false
      t.string :url
      t.references :user, null: false, foreign_key: true, type: :integer

      t.timestamps
    end
  end
end
