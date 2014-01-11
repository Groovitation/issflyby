# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pass do
    risetime Time.now
    duration 1
    association :user
  end
end
