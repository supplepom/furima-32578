class PersonalInformation
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :address_id, :city, :house_number, :building, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
    validates :house_number, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "is invalid. Input full-width characters." }
    validates :phone_number, numericality: { only_integer: true, message: "is invalid. Input half-width characters." } 
    validates :token
  end

  with_options presence: true, numericality: { other_than: 1 } do 
    validates :address_id 
  end  

  def save
   order = Order.create(item_id: item_id, user_id: user_id)
   Destination.create(postal_code: postal_code, address_id: address_id, city: city, house_number: house_number, building: building, phone_number: phone_number, order_id: order.id )
  end

 
end
