# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    admin false
    name "MyString"
    email "MyString"
    provider "MyString"
    uid "MyString"
    sequence(:lat) { (Random.new.rand(-90000...90000).to_f * 0.001) }
    sequence(:long) { (Random.new.rand(-180000...180000).to_f * 0.001) }
    factory :admin do
      admin true
    end
    factory :fuzzy do
      name "Fuzzy"
      lat 32.735419
      long -97.102076
    end
  end
end
