class User < ApplicationRecord
	before_save {email.downcase}
	has_many :posts
	has_many :comments
	validates :username, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: {maximum: 255},
					  format: { with: VALID_EMAIL_REGEX},
					  uniqueness: {case_sensitive: false}
	validates :password, length: {minimum: 8}, presence: true
end
