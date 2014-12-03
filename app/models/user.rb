class User < ActiveRecord::Base
  validates_uniqueness_of :uid, :scope => :provider
  validates :name, presence: true
  validates :avatar,
             attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
             attachment_size: { less_than: 5.megabytes }


  has_attached_file :avatar, styles: {
                               thumb: '50x50#',
                               profile: '150x150#'
                           }

  GENDER_TYPES = ["--", "Male", "Female"]

  has_many :followers, :dependent => :destroy
  has_many :fws, through: :followers, :class_name => 'User'

  has_many :inverse_followers, :class_name => 'Follower', :foreign_key => "fw_id"
  has_many :inverse_fws, :through => :inverse_followers, :source => :user

  has_many :messages, :dependent => :destroy

  def user_params
    params.require(:user).permit(:name, :email, :provider, :uid, :oauth_token, :oauth_expires_at,
                                 :gender, :avatar, :degree, :position, :institution, :department)
  end
end