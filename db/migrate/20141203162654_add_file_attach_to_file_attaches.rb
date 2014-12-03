class AddFileAttachToFileAttaches < ActiveRecord::Migration
  def self.up
    change_table :file_attaches do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment  :file_attaches, :file
  end
end
