FactoryBot.define do
  factory :personal_information do
    postal_code { '123-4567' }
    address_id { 2 }
    city { '横浜市緑区' }
    house_number { '青山1−1−1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
    user_id { 2 }
    item_id { 1 }
    
  end
end
