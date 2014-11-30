class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id, :references => "user"
      t.integer :sender_id, :references => "user"
      t.string :subject
      t.text :message
      t.boolean :read
      t.timestamps
    end
  end
end
