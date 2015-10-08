FactoryGirl.define do
  factory :expense do
    association :user, factory: :user
    expense_type { Faker::Internet.email }
    amount { Faker::Commerce.price }
  end
end