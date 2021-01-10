class Order < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_one :destination
  has_one :personal_information
end
