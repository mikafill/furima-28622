FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday { Faker::Date.birthday }
    first_name { Faker::Japanese::Name.first_name }
    last_name { Faker::Japanese::Name.last_name }
    kana_first_name { Gimei.first.katakana }
    kana_last_name { Gimei.last.katakana }
  end
end
