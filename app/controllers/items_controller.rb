class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index, :show]
  before_action :set_message, only: [:show, :edit, :destroy]
  before_action :move_to_root_path, only: [:update, :destroy]


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
  end
  
  def edit
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
    if @item.destroy
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
  unless current_user.id == @item.user.id
  redirect_to root_path 
  end
end

def set_message
  @item = Item.find(params[:id])
end
