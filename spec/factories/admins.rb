FactoryBot.define do
  factory :admin do
    name                  {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(6)}
    password_confirmation {password}
  end
end
