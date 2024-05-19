require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @post = posts(:one)
    @user = users(:one)
    @category = categories(:one)

    @post_params = {
      title: Faker::Games::DnD.title_name,
      body: Faker::Books::Lovecraft.paragraphs.join("\n"),
      creator: @user,
      category_id: @category.id
    }
  end

  test 'should get index' do
    get root_url
    assert_response :success
    assert_includes response.body, @post.title
  end

  test 'should create a new post' do
    sign_in @user

    assert_difference -> { Post.count } do
      post posts_url, params: { post: @post_params }
    end

    assert_redirected_to root_url
    assert { Post.exists?(title: @post_params[:title]) }
  end

  test 'should create a new post with logout user' do
    assert_no_difference -> { Post.count } do
      post posts_url, params: { post: @post_params }
    end

    assert_response :redirect
  end

  test 'should create a new post with invalid params' do
    sign_in @user

    assert_no_difference -> { Post.count } do
      post posts_url, params: { post: { title: '', body: '', creator: @user, category_id: 1 } }
    end

    assert_response :unprocessable_entity
  end
end
