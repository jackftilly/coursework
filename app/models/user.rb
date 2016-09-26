# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :username, :session_token, :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many :goals
  has_many :comments, as: :commentable

  attr_reader :password
  after_initialize :generate_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil unless user
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(32)
    self.save!
    self.session_token
  end

  private
  def generate_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(32)
  end
end