class AddIndexToMessages < ActiveRecord::Migration
  def change
    add_index :messages, [:user_id, :sender_id, :created_at]
  end
end
