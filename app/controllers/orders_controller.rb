class OrdersController < ApplicationController
  before_action :authenticate_user!,except: [:create]
  before_action :move_to_root_path, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]


  def index
    @personal_information = PersonalInformation.new
    @information =  Item.find(params[:item_id])
  end

  def create
    @personal_information = PersonalInformation.new(information_params)
    if @personal_information.valid?
     pay_item
      @personal_information.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def information_params
    params.require(:personal_information).permit(:postal_code, :address_id, :city, :house_number, :building, :phone_number ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def price_params
    Item.find(params[:item_id])
  end

  def order_params
    params.require(:personal_information).permit(:price).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: price_params[:price],  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end

   def move_to_root_path
    @information =  Item.find(params[:item_id])
    if current_user.id == @information.user.id
    redirect_to root_path
    
    end
  end

  def move_to_index
    @information =  Item.find(params[:item_id])
    if user_signed_in? && @information.order.present?
      redirect_to root_path
    end
  end

end
