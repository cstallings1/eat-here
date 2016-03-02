require 'bcrypt'
class User < ActiveRecord::Base
  has_many :restaurants

  validates :username, presence: true, uniqueness: true
  validate :validate_password
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.find_by(username: username)
    if user && user.password == password
      user
    else
      nil
    end
  end

  private
  def validate_password
    if @raw_password.nil? || @raw_password.length < 6
      errors.add(:password, "Password must be at least 6 characters.")
    end
  end

end
