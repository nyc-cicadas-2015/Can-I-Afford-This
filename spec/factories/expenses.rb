FactoryGirl.define do
  factory :expense do
    association :user, factory: :user
    association :expense_type, factory: :expense_type
    amount { Faker::Commerce.price }
  end
end