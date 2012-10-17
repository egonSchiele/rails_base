class User < ActiveRecord::Base
  attr_accessible :name, :email, :password_hash, :password_salt, :password, :password_confirmation

  attr_accessor :password
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email

  before_save :encrypt_password

  def self.authenticate(email, password)
    user = find_by_email(email)
    user && correct_password?(user, password) ? user : nil
  end

  def self.correct_password?(user, password)
    user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret password, password_salt
    end
  end
end
