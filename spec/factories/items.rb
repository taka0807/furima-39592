# FactoryBot.define do
#   factory :item do
    
#   end
# end


FactoryBot.define do
  factory :item do
    productname { Faker::Commerce.product_name }
    explanation { Faker::Lorem.paragraph }
    category_id { rand(2..11) } # もしくは category_id: 1 (適切なIDを指定)
    product_condition_id { rand(2..7) } # 適切なIDを指定
    pay_of_shipping_id { rand(2..3) } # 適切なIDを指定
    region_of_origin_id { rand(2..48) } # 適切なIDを指定
    number_of_days_until_shipping_id { rand(2..4) } # 適切なIDを指定
    price { rand(300..9999999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end