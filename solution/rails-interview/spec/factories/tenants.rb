FactoryGirl.define do 
  factory :tenant do 
    name { Faker::Name.name }
    api_key { SecureRandom.hex }
    request_count { 0 }
  end
end