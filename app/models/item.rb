class Item < ApplicationRecord

  
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :address
  belongs_to :preparation_day

  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :description
    validates :price
  end

  with_options presence: true, numericality: { other_than: 1 } do 
    validates :category_id
    validates :condition_id 
    validates :postage_id 
    validates :address_id 
    validates :preparation_day_id
  end

  with_options presence: true, format: { with: /[0-9]/, message: 'is invalid. Input half-width number.' } do
    validates :price
  end

  validates :price,numericality: { greater_than_or_equal_to: 300, less_than: 9999999, message: 'Out of setting range' }
  
  
end
