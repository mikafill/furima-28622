FactoryBot.define do
  factory :item do

    name {Faker::Name.initials(number: 2)}
    explaination {Faker::Lorem.sentence}
    price {Faker::Number.within(range: 300..9999999)}
    category_id {Faker::Number.within(range: 2..11)}
    condition_id {Faker::Number.within(range: 2..7)}
    delivery_area_id {Faker::Number.within(range: 2..47)}
    delivery_day_id {Faker::Number.within(range: 2..4)}
    fee_type_id {Faker::Number.within(range: 2..3)}

    association :user
  end
end
