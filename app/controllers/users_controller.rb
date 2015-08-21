class UsersController < ApplicationController
  before_filter :authorize, only: [:show]
  #form to create new user
  def new
    if current_user
      redirect_to profile_path
    else
      @user = User.new
      render :new
    end
  end

  #create new user in db
  def create
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new(user_params)

      respond_to do |format|
      
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Congrats, you're now part of Git Around!"
        UserMailer.welcome_email(@user).deliver
        
        redirect_to user_path(current_user)
        flash[:notice] = "Welcome to your Profile Page!"
      else
        redirect_to signup_path
        flash[:notice] = "You need to sign up before viewing profiles"
      end
    end
  end

  #edit the profile page
  def edit 
    if current_user
      @user = User.friendly.find(params[:id])
    else
        redirect_to signup_path
        flash[:notice] = "You need to sign up before to edit profiles"
    end  
  end 

  #update the profile page
  def update
    if @user = current_user
      #get updated data
      updated_attributes = params.require(:user).permit(:email, :username, :password, :password_confirmation, :avatar)
      # update the creature
      current_user.update_attributes(updated_attributes)
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end

  #show profile page
  def show
    @user = User.friendly.find(params[:id])
    render :show
  end


  #private methods
  private
      def user_params
          params.require(:user).permit(:email, :username, :password, :password_confirmation, :avatar)
      end
    end
end