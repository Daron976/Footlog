class CommentsController < ApplicationController
  protect_from_forgery with: :null_session
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

  def createjson
    @new_comment = Comment.new(author_id: params[:author_id], post_id: params[:post_id], Text: params[:Text])

    if @new_comment.save
      render json: @new_comment, status: :created
    else
      render json: @new_comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    author_id = current_user.id.to_i
    comment_id = params[:comment_id]
    post_id = params[:post_id].to_i
    @comment = Comment.find(comment_id)
    if @comment.destroy[0]
      flash[:success] = 'Comment deleted'
    else
      flash.now[:error] = 'Comment could not be deleted'
    end
    redirect_to "/users/#{author_id}/posts/#{post_id}"
  end

  def data
    post_id = params[:post_id].to_i
    @comments = Comment.where(:post_id == post_id)

    render json: @comments
  end
end
