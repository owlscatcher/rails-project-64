# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  before_action :set_post, only: %i[show]

  def index
    @pagy, @posts = pagy(Post.includes(:creator).all)
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = @post.comments.includes(:user)
    @user_likes = @post.likes.find_by(user_id: current_user.id) if current_user
    @comment = PostComment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path, notice: t('.success')
    else
      flash.now[:error] = t('.fail')
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
