class CreateFileAttaches < ActiveRecord::Migration
  def change
    create_table :file_attaches do |t|
      t.references :message, index: true

      t.timestamps
    end
  end
end
