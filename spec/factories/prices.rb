FactoryBot.define do
  factory :price do
    category_id       { 1 }
    age_id            { 1 }
    free_price         { Faker::Number.number }
    not_free_price     { Faker::Number.number }
  end
end
