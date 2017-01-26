require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  def setup
  	@post = Post.new(url: "http://www.theodinproject.com", title: "What a cool site!", body: "This is a great site for learning Rails web development.", user_id: 1)
  end

  test "post should be valid" do
  	User.create(id: 1, username: "example", email: "severnsc@gmail.com", password: "123456789")
  	assert @post.valid?, "#{@post.errors.inspect}"
  end

  test "url should be present" do
  	@post.url = "     "
  	assert_not @post.valid?
  end

  test "title should be present" do
  	@post.title = "    "
  	assert_not @post.valid?
  end

  test "body should be present" do
  	@post.body = "     "
  	assert_not @post.valid?
  end

  test "user id should be present" do
  	@post.user_id = "    "
  	assert_not @post.valid?
  end
end