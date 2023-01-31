class PostsController < ApplicationController
  def index
    @author_id = params[:author_id].to_i
    @user = User.find(@author_id)
    @posts = @user.posts.includes(:comments)
  end

  def show
    @author_id = params[:author_id].to_i
    @post_id = params[:post_id].to_i
    @user = User.find(@author_id)
    @post = Post.includes(:comments).find(@post_id)
    @post_comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    user = current_user
    @data = params[:post]
    new_post = Post.new(author_id: user.id, Title: @data[:Title], Text: @data[:Text])
    if new_post.save
      flash[:success] = 'Post has been created'
      redirect_to "/users/#{user.id}/posts"
    else
      flash.now[:error] = 'Incorrect data'
      render new
    end
  end

  def like
    author_id = params[:author_id].to_i
    post_id = params[:post_id].to_i
    new_like = Like.new(author_id:, post_id:)
    if new_like.save
      flash[:success] = 'Liked'
      redirect_to "/users/#{author_id}/posts"
    else
      flash.now[:error] = 'Post could not be liked'
      redirect_to "/users/#{author_id}/posts/#{post_id}"
    end
  end
end
