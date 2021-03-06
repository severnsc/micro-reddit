require 'test_helper'

class UserTest < ActiveSupport::TestCase
   
	def setup
		@user = User.new(username: "severnsc", email: "severnsc@gmail.com", password: "12345678")
	end

   test "user should be valid" do
   	assert @user.valid? 	
   end

   test "name should be present" do
   	@user.username = "     "
   	assert_not @user.valid?
   end

   test "username should be 50 chars or less" do
    @user.username = "a" * 51
    assert_not @user.valid?
   end

   test "email should be present" do
   	@user.username = "     "
   	assert_not @user.valid?
   end

   test "password should be at least 8 characters" do
   	@user.password = "1234"
   	assert_not @user.valid?
   end

   test "email validation should accept valid email addresses" do
  	valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
  	valid_addresses.each do |valid|
  		@user.email = valid
  		assert @user.valid?, "#{valid.inspect} should be valid"
  	end
  end

  test "email validation should not accept invalid email addresses" do
  	invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com foo@bar..com]
  	invalid_addresses.each do |invalid|
  		@user.email = invalid
  		assert_not @user.valid?, "#{invalid.inspect} should not be valid"
  	end
  end

  test "email addresses should be unique" do
  	duplicate_user = @user.dup
  	duplicate_user.email = @user.email.upcase
  	@user.save
  	assert_not duplicate_user.valid?
  end

  test "email addresses should be saved as all lower case" do
  	mixed_case_email = "FoO@ExAmPlE.CoM"
  	@user.email = mixed_case_email
  	@user.save
  	assert_equal mixed_case_email.downcase, @user.email
  end

  test "password should be present" do
    @user.password = " " * 8
    assert_not @user.valid?
  end
end
