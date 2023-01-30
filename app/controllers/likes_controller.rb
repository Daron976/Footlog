class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    author_id = params[:author_id].to_i
    post_id = params[:post_id].to_i
    new_like = Like.new(AuthorId: author_id, PostId: post_id)
    if new_like.save
      flash[:success] = 'Liked'
    else
      flash.now[:error] = 'Post could not be liked'
      redirect_to "/users/#{author_id}/posts/#{post_id}"
    end
  end
end
