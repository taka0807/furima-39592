FactoryBot.define do
  factory :purchases_address do
    post_code { '123-4567' }
    region_of_origin_id { 2 } # 適切なIDを設定してください
    municipalities { '東京都' }
    street_address { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
