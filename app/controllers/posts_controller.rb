class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
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
    @post = Post.find(post_params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end
end
