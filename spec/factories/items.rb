FactoryBot.define do
  factory :item do
 
    title                { 'テスト' }
    description          { 'テスト' }
    category_id          { '2' }
    condition_id         { '2' }
    postage_id           { '2' }
    address_id           { '2' }
    preparation_day_id   { '2' }
    price                { '1000' }
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
    end
end
