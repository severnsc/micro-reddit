class Post < ApplicationRecord
	validate :url, presence: true
	validate :title, presence: true
	validate :body, presence: true
	validate :user_id, presence: true
	belongs_to :user
	has_many :comments
end
