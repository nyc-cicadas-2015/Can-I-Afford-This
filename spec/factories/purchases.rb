FactoryGirl.define do
  factory :purchase do
    association :user, factory: :user
    association :purchase, factory: :purchase
    cost { Faker::Commerce.price }
  end
end