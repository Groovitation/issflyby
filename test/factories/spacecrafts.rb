# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :spacecraft do
    name "MyString"
    crew 1
    lat 1.5
    long 1.5
  end
end
