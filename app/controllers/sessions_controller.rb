class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to root_url
        flash[:success] = "Successfully logged in!"
    else
        render 'new'
        flash.now[:danger] = "Invalid content. Try again."  
    end
  end

  def destroy
    log_out        
    redirect_to root_url
    flash[:success] = "Logout!"
  end
end
