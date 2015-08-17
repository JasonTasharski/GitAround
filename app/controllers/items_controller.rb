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
  end

  def edit
  end

  def update
  end

  private
      def item_params
          params.require(:item).permit(:activity_name, :description, :category, :location)
      end
end

