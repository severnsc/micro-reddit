require 'test_helper'

class UserTest < ActiveSupport::TestCase
   
	def setup
		@user = User.new(username: "severnsc", email: "severnsc@gmail.com", password: "12345678")
	end

   test "user should be valid" do
   	assert @user.valid? 	
   end
end
