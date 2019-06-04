FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password"}
    password_confirmation { "password" }
    confirmed_at { Date.today }
    name { Faker::Name.unique.name }
    role
  end
end
