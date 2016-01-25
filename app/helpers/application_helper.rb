module ApplicationHelper

    def is_logged_in?
        return true if session[:current_user_id]
        false
    end

end
