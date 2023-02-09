class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.integer :the_day_studytime, null: false
      t.boolean :timeline_post, default: false, null: false
      t.integer :understanding, default: 0, null: false
      t.references :user, null: false, foreign_key: true
      t.references :habit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
