class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :degree, :string
    add_column :users, :position, :string
    add_column :users, :institution, :string
    add_column :users, :department, :string
  end
end
