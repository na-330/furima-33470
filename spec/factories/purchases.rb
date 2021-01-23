FactoryBot.define do
  factory :purchase do
    postal_code { "123-4567" }
    city { "あああ" }
    house_number { "1-1" }
    building { "あああ" }
    phone_number { "11122223333" }
    prefecture_id { "5" }
    token {"tok_abcdefghijk00000000000000000"}
  end
end