class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    puts 'testing'
  end
end
