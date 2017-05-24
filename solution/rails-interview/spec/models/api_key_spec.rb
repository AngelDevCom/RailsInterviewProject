require "rails_helper"

describe ApiKey, type: :model do 
  it "has a valid factory" do 
    expect(FactoryGirl.create(:api_key)).to be_valid
  end

  describe "#generate_access_token" do 
    it "creates a unique access token" do 
      old_key = FactoryGirl.create(:api_key, access_token: "12345")
      new_key = FactoryGirl.create(:api_key, access_token: "12345")

      expect(new_key.access_token).to_not eq("12345")
      expect(old_key.access_token).to_not eq(new_key.access_token)
    end
  end
end