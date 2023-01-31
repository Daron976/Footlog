class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post_id = params[:post_id]
  end

  def create
    user = current_user
    @data = params[:Text]
    @post_id = params[:post_id].to_i
    new_comment = Comment.new(author_id: user.id, post_id: @post_id, Text: @data)
    if new_comment.save
      flash[:success] = 'Comment has been created'
      redirect_to "/users/#{user.id}/posts"
    else
      flash.now[:error] = 'Incorrect data'
      redirect_to "/users/#{@post_id}/new_comment"
    end
  end
end
