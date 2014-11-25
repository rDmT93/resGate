class Follower < ActiveRecord::Base
  belongs_to :user
  belongs_to :fw, :class_name => 'User', :foreign_key => 'fw_id'
end
