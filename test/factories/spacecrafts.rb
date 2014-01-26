# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :spacecraft do
    name "International Space Station"
    apiname "ISS"
    crew 6
    lat 1.5
    long 1.5
  end
end
