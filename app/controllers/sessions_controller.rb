class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
      
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      if user.admin? 
        sign_in user
        redirect_back_or admin_path
      else 
        sign_in user
        redirect_back_or user
      end
    end
  end
  
  def destroy
    sign_out
    redirect_to home_page_path
  end

end
