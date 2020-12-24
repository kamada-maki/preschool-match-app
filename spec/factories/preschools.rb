FactoryBot.define do
  factory :preschool do
    name              {Faker::Name.last_name}
    post_number       {"123-4567"}
    area_id           {2}
    street_number     {Faker::Address.street_address}
    building          {Faker::Address.secondary_address}
    phone_number      {"09012345678"}
    access            {Faker::Lorem.sentence(1..30)}
    open_hour         {Faker::Number.decimal_part(digits: 2)}
    close_hour        {Faker::Number.decimal_part(digits: 2)}
    capacity          {Faker::Number.number(digits: 10)}
    category_id       {2}
    concept          {Faker::Lorem.sentence(1..150)}
    association :admin
  end
end
