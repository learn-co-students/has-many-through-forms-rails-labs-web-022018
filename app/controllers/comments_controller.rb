class CommentsController < ApplicationController

  def create
    byebug
    comment = Comment.create(comment_params)
    post = Post.find(request.referrer.split("/").last)
    comment.post = post
    redirect_to post_path(post)
  end

#   private
#
  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
