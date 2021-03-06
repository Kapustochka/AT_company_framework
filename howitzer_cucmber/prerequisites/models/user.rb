require_relative 'base'
# Example User Model
class User < Base
  attr_accessor :email, :name, :password, :last_name

  def self.default
    where(email: Howitzer.app_test_user).first
  end
end
