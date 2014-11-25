class AddUserIdToFollowers < ActiveRecord::Migration
  def change
    add_index :followers, :user_id
    add_index :followers, :fw_id
  end
end
