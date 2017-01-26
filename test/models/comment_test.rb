require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  def setup
  	@comment = Comment.new(body: "This is a comment.", user_id: 1, post_id: 1)
  end

  test "comment should be valid" do
  	User.create(id: 1, username: "example", email: "severnsc@gmail.com", password: "123456789")
  	Post.create(id: 1,url: "http://www.theodinproject.com", title: "What a cool site!", body: "This is a great site for learning Rails web development.", user_id: 1)
  	assert @comment.valid?
  end

  test "body should be present" do
  	@comment.body = "    "
  	assert_not @comment.valid?
  end

  test "user id should be present" do
  	@comment.user_id = "   "
  	assert_not @comment.valid?
  end

  test "post_id should be present" do
  	@comment.post_id = "   "
  	assert_not @comment.valid?
  end

  test "user should exist" do
  	@comment.user_id = 2
  	assert_not @comment.valid?
  end

  test "post should exist" do
  	@comment.post_id = 2
  	assert_not @comment.valid?
  end
end
