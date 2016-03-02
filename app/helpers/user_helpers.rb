helpers do

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def ensure_login
    if logged_in?
      return true
    else
      halt(404, erb(:"sessions/error"))
    end
  end

end


