class UsersController < ApplicationController
  #form to create new user
  def new
      @user = User.new
      render :new
  end

  #create new user in db
  def create
    if current_user
      redirect_to profile_path
    else
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(current_user)
        flash[:notice] = "Complete your profile!"
        else
            redirect_to signup_path
        end
    end
  end

  #edit the profile page
  def edit 
    if current_user
      @user = User.find(params[:id])  
    end  

  end 

  #update the profile page
  def update
    if @user = current_user
      #get updated data
      updated_attributes = params.require(:user).permit(:email, :username, :password, :avatar)
      # update the creature
      current_user.update_attributes(updated_attributes)
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end

  #show profile page
  def show
    @user = User.find(params[:id])
    render :show
  end


  #private methods
  private
      def user_params
          params.require(:user).permit(:email, :username, :password, :avatar)
      end
end