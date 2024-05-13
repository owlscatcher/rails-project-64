module Posts
  class CommentsController < ApplicationController
    before_action :authenticate_user!, only: %i[create]

    def create
      @comment = resource_post.comments.build(comments_params)
      @comment.user = current_user

      if @comment.save
        redirect_to resource_post, notice: 'Comment was successfully created'
      else
        redirect_to resource_post, notice: 'Comment not created'
      end
    end

    private

    def comments_params
      params.require(:post_comment).permit(:content)
    end
  end
end
