FactoryGirl.define do
  factory :expense do
    association :user, factory: :user
    association :expense, factory: :expense
    amount { Faker::Commerce.price }
  end
end