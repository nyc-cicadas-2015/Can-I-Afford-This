FactoryGirl.define do
  factory :purchase_type do
    name { Faker::Number.between(1, 3) }
  end
end