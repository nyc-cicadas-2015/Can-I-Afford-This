FactoryGirl.define do
  factory :expense do
    association :user, factory: :user
    type { Faker::Internet.email }
    amount { Faker::Commerce.price }
  end
end