class UsersController < ApplicationController
  def create
    params[:users].permit!
    @user = User.new(params[:users])
    if @user.save
      login(@user)
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  def show
    @user = current_user
    @posts = @user.posts
  end
end
