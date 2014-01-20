# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "MyString"
    email "MyString"
    provider "MyString"
    uid "MyString"
    sequence(:lat) { (Random.new.rand(-180000...180000).to_f * 0.01) }
    sequence(:long) { (Random.new.rand(-180000...180000).to_f * 0.01) }
  end
end
