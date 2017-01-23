class SessionsController < ApplicationController
  def create
    params[:session].permit!
    if User.find_by(username: params[:session][:username]).try(:authenticate,params[:session][:password])
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
