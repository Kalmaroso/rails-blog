class SessionsController < ApplicationController
  def create
    params[:session].permit!
    @user = User.find_by(username: params[:session][:username])
    if @user.authenticate(params[:session][:password])
      login(@user)
      redirect_to root_path
    else
      redirect_to login_path
    end
  end
  def destroy
    logout
    redirect_to root_path
  end
end
