FactoryBot.define do
  factory :item do
    name            {Faker::Name.initials(number: 4)}
    description     {"テスト用"}
    category_id     {2}
    condition_id    {2}
    cost_id         {2}
    area_id         {2}
    day_id          {2}
    price           {Faker::Number.number(digits: 4)}
  end
end