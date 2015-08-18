class ItemsController < ApplicationController

  def create
    @user = current_user
    @itinerary = Itinerary.find(params[:itinerary_id])
    @item = @itinerary.items.create(item_params)
    
    if @item.save
      redirect_to :back
    else 
      redirect_to :back
    end
  end

  def show
    @item = Item.find(params[:itinerary_id])
    render :show
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to itinerary_path
  end

  def edit
      @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if current_user.itineraries.include? itinerary
      item.update_attributes(item_params)
      redirect_to itinerary_path
    else
      redirect_to login_path
    end
  end

  private
      def item_params
          params.require(:item).permit(:activity_name, :description, :category, :location)
      end
end

