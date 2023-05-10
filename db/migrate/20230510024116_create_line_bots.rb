class CreateLineBots < ActiveRecord::Migration[7.0]
  def change
    create_table :line_bots do |t|
      t.references :user, null: false, foreign_key: true
      t.time :alert_time, null: false

      t.timestamps
    end
  end
end
