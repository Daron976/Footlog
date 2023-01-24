class PostsController < ApplicationController
  def index
    @comment_index = 0
    @author_id = params[:author_id].to_i
    @user = [User.find(@author_id)]
    id_array = []
    @comments = []
    @posts = Post.where(@author_id == :AuthorId)
    @posts.each { |post| id_array.push(post.id) }
    id_array.each do |el|
      @comments.push(Comment.where(el == :PostId))
    end
  end

  def show
    @author_id = params[:author_id].to_i
    @post_id = params[:post_id].to_i
    @user = User.find(@author_id)
    @post = Post.find(@post_id)
    @post_comments = Comment.where(@post_id == :PostId)
  end
end
