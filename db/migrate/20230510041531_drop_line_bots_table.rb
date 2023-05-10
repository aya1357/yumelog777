class DropLineBotsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :line_bots
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
