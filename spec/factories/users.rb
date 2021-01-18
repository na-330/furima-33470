FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name_j { Gimei.first.kanji }
    last_name_j { Gimei.last.kanji }
    first_name_k { Gimei.first.katakana }
    last_name_k { Gimei.last.katakana }
    birth_date { '2000-01-01' }
  end
end
