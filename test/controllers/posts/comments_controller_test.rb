# frozen_string_literal: true
require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @post = posts(:one)
    @user = users(:one)
    @root_commet = post_comments(:one)
    @with_comments = post_comments(:with_comments)
    @nested = post_comments(:nested)

    sign_in @user
  end

  test 'should create root comment' do
    assert_difference -> { PostComment.count } do
      post post_comments_path(@post), params: { post_comment: { content: 'test', user: @user, parent_id: nil } }
    end

    assert_redirected_to post_path(@post)
  end

  test 'should create nested comment' do
    assert_difference -> { PostComment.count } do
      post post_comments_path(@post), params: { post_comment: { content: 'test', user: @user, parent_id: @with_comments.id } }
    end

    assert_redirected_to post_path(@post)
  end
end
