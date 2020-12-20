class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :explaination, :category_id,
       :condition_id, :fee_type_id, :delivery_area_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
