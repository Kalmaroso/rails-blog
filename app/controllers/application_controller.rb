class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def login(user)
    session[:current_user_id] = user.id
  end

  def logout
    session.clear
  end

  def current_user
    @_current_user ||= session[:current_user_id] &&
    User.find_by(id: session[:current_user_id])
  end

  def current_user_id
    session[:current_user_id]
  end
end
