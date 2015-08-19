class SessionsController < ApplicationController
  
  def new
    # redirect user if already logged in
    if current_user
      redirect_to root_path
    else
      render :new
    end  
  end

  def create
    user = User.find_by_email(user_params[:email])
    # if the user exists and the password matches
    if user && user.authenticate(user_params[:password])
      # save user id to session to keep them logged in
      session[:user_id] = user.id
      flash[:notice] = "You are now logged in."
      redirect_to user_path(current_user)
    else
      # if the user's login doesn't work, send them back to the home page
      flash[:error] = "Incorrect email or password. Please try again." 
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are now logged out."
    redirect_to root_path
  end

  private
    def user_params
        params.require(:user).permit(:email, :password)
    end
    
end