module SessionsHelper

  def sign_in(user)
    if params[:remember_me]
       cookies.permanent[:auth_token] = user.auth_token
       self.current_user = user
    else
       cookies[:auth_token] = user.auth_token
       self.current_user = user 
    end
   
  end
  
  def sign_out
    cookies.delete(:auth_token)
    self.current_user = nil
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  # sets c_user to that value, but only if it is undefined (known as 'or equals'  )
  def current_user
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  
  def current_user?(user)
    user == current_user
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def admin?
    signed_in? && current_user.admin?
  end
  
  def authenticate
    deny_access unless signed_in?
  end
  
  def deny_access
    store_location
    redirect_to signin_path, :notice => "Please sign in to access this page."
  end
  
  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

  private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
    
    def store_location
      session[:return_to] = request.fullpath
    end
    
    def clear_return_to
      session[:return_to] = nil
    end
end