FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(6) }
    password_confirmation { password }
  end
end
