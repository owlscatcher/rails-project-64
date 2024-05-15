module Posts
  class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
      @resource_post.likes.create(user: current_user)
      redirect_to post_path(@post)
    end

    def destroy
      @resource_post.likes.find_by(user: current_user).destroy
      redirect_to post_path(@post)
    end

    private

    def like_params
      params.require(:like).permit(:post_id)
    end
  end
end
