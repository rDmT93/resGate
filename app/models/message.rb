class Message < ActiveRecord::Base
  validates :subject, :message, presence: true

  has_many :file_attaches, :dependent => :destroy

  belongs_to :user

  def message_params
    params.require(:message).permit(:user_id, :sender_id, :subject, :message, :read)
  end
end