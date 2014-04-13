FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@factory.com" }
    password "123123"
    password_confirmation { "123123" }
  end
end