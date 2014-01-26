# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :spaceperson do
    name "John Blaha"
    association :spacecraft
  end
end
