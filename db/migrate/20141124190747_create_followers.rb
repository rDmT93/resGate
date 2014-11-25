class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :user_id, :references => "user"
      t.integer :fw_id, :references => "user"
      t.timestamps
    end
  end
end