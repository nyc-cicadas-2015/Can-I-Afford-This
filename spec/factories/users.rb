FactoryGirl.define do
  factory :user do
    name Faker::Internet.user_name
    email Faker::Internet.email
    password Faker::Internet.password(6)
  end

  factory :new_user, class: User do
    name {Faker::Internet.user_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(6)}
  end
end