require 'digest'

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

class User < ActiveRecord::Base

  has_many :entries

  before_save do
    self.username = username.downcase
    self.password = User.get_hash(self.password)
  end

  validates_presence_of :username
  validates_presence_of :password
  validates_confirmation_of :password

  validates :username, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: true

  def User.authenticate(username, password)
    password_digest = User.get_hash(password)
    User.find_by(username: username, password: password_digest)
  end

  def User.get_hash(password)
    md5 = Digest::MD5.new
    md5.hexdigest password
  end

  def User.password_verified?(password_hash, password)
    User.get_hash password == password_hash
  end

end

