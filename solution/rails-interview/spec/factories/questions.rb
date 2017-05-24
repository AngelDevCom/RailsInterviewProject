FactoryGirl.define do 
  factory :question do 
    title { Faker::Name.title }
    private { Faker::Boolean.boolean }
    user
  end
end