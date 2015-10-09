FactoryGirl.define do
  factory :purchase do
    association :user, factory: :user
    category { Faker::Number.between(1, 3) }
    cost { Faker::Commerce.price }
  end
end