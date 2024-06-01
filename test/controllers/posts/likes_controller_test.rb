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
    post post_likes_path(@post), params: { like: @like }

    assert_redirected_to @post
    assert { PostLike.exists?(post_id: @like.post_id, user_id: @like.user_id) }
  end

  test 'should destroy a like' do
    like = PostLike.create!(user: @user, post: @post)

    delete post_like_path(@post, like)

    assert_redirected_to @post
    assert { !PostLike.exists?(post_id: like, user_id: like) }
  end

  test 'should destroy a invalid like' do
    delete post_like_path(@post, @like)

    assert_redirected_to @post
    assert { PostLike.exists?(post_id: @like, user_id: @like) }
  end
end
