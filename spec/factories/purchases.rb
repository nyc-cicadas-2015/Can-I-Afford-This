FactoryGirl.define do
  factory :purchase do
    association :user, factory: :user
    association :purchase_type, factory: :purchase_type
    cost { Faker::Commerce.price }
  end
end