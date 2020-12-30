class ItemsController < ApplicationController
  before_action :move_to_root_path, only: [:update, :destroy]
  before_action :authenticate_user!,except: [:index, :show]

  def index
     @items = Item.order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
  end
  
  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.new(item_params)
    if @item.update(item_params)
    redirect_to item_path
   else
     render :edit
   end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
    redirect_to root_path
    else
    render :show
    end
  end


  private

  def item_params
    params.require(:item).permit(:title, :description, :category_id, :condition_id, :postage_id, :address_id, :preparation_day_id, :price,:image).merge(user_id: current_user.id)
  end
end

def move_to_root_path
  @item = Item.find(params[:id]) 
  unless user_signed_in? && current_user.id == @item.user.id
  redirect_to root_path 
  end
end