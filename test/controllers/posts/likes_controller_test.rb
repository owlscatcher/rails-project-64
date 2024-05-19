# frozen_string_literal: true
require 'test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:one)
    sign_in @user

    @post = posts(:two)
    @like = post_likes(:one)
  end

  test 'should create a likes' do
    assert_difference -> { PostLike.count } do
      post post_likes_path(@post), params: { like: @like }
    end

    assert_redirected_to @post
  end

  test 'should destroy a like' do
    like = PostLike.create!(user: @user, post: @post)

    assert_difference -> { PostLike.count }, -1 do
      delete post_like_path(@post, like)
    end
    assert_redirected_to @post
  end

  test 'should destroy a invalid like' do
    assert_no_difference -> { PostLike.count }, -1 do
      delete post_like_path(@post, @like)
    end
    assert_redirected_to @post
  end
end
