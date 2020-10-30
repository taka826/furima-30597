FactoryBot.define do
  factory :user_item do
    postal_code { '123-4567' }
    area_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    phone { '08012345678' }
    build_name { '東京ハイツ' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end