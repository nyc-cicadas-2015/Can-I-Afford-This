FactoryGirl.define do
  factory :expense_type do
    name { Faker::Company.buzzword }
  end
end