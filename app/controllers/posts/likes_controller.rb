module Posts
  class LikesController < ApplicationController
    before_action :authenticate_user!

    def create
      resource_post.likes.find_or_create_by(user: current_user)
      redirect_to resource_post
    end

    def destroy
      resource_post.likes.find_by(user: current_user).destroy
      redirect_to resource_post
    end

    private

    def post_params
      params.require(:post_like).permit(:post_id)
    end
  end
end
