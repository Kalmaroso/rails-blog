module ApplicationHelper
    def current_user
      @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
    end

    def current_user_id
      session[:current_user_id]
    end

    def user?
      if current_user_id != nil
        true
      else
        false
      end
    end
end
