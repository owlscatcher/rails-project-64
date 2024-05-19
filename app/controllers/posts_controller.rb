class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create]
  before_action :set_post, only: %i[show]

  def index
    @pagy, @posts = pagy(Post.all)
  end

  def show
    @post = Post.find(params[:id])
    @user_likes = @post.likes.find { |like| like.user_id == current_user.id } if current_user
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
      render :new, status: :unprocessable_entity, notice: t('.fail')
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
