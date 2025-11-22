require 'bcrypt'

class AdminUser < ApplicationFirebaseModel
  attribute :username, :string
  attribute :password_digest, :string

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def authenticate(test_password)
    return false unless password_digest
    BCrypt::Password.new(password_digest) == test_password
  end

  def self.find_by_username(username)
    all.find { |user| user.username == username }
  end
end
