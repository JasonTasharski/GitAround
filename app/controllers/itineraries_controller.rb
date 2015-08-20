class ItinerariesController < ApplicationController

   
  def index
    @itinerary = Itinerary.order(created_at: :desc)
  end

  def new
    @itinerary = Itinerary.new
    @user = current_user
    render :new 
  end

  def create
    @user = current_user
    @itinerary = @user.itineraries.new(itinerary_params)
    @itinerary.parent = @user.id
    if @itinerary.save
      redirect_to user_itinerary_path(@user, @itinerary)
    else
      redirect_to new_user_itinerary_path(@user)
    end
  end

  def show
    @itinerary = Itinerary.friendly.find(params[:id])
    render :show
  end

  def edit
    @itinerary = Itinerary.friendly.find(params[:id])
  end

  def update
    itinerary = Itinerary.friendly.find(params[:id])
    if current_user.itineraries.include? itinerary
      itinerary.update_attributes(itinerary_params)
      redirect_to user_itinerary_path
    else
      redirect_to login_path
    end
  end

  def destroy
    @user = current_user
    Itinerary.friendly.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end

  def clone
    itinerary = Itinerary.friendly.find(params[:itinerary_id])
    itinerary_clone = itinerary.dup
    @user = current_user
    itinerary_clone.user_id = @user.id
    itinerary_clone.cover = itinerary.cover
    
    if itinerary_clone.save
      itinerary.items.each do |item|
          itinerary_item = Item.find(item.id)
          itinerary_item_clone = itinerary_item.dup
          itinerary_item_clone.save
          itinerary_item_clone.itinerary_id = itinerary_clone.id
          itinerary_item_clone.save
          puts 'Cat'
          puts itinerary_item_clone.itinerary_id
          puts 'Dog'
          puts itinerary_item.itinerary_id
          
      end    
      puts 'Manu'
      puts itinerary_clone.items
      redirect_to user_path(@user)
    
    else
      redirect_to new_user_itinerary_path(@user)
    end
  end    

  private
  def itinerary_params
    params.require(:itinerary).permit(:title, :description, :cover)
  end 

end


