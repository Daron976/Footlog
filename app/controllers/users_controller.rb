class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    id = params[:author_id].to_i
    @user = [User.find(id)]
    @posts = @user[0].latest_posts
  end
end
