FactoryGirl.define do 
  factory :answer do 
    body { Faker::Name.title }
    question
    user
  end
end