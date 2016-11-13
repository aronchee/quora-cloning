require 'bcrypt'

class User < ActiveRecord::Base
	has_secure_password
	validates :email, format: { with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ }
	validates :email, uniqueness: true
	validates :password, length: {in: 6..20}
end





