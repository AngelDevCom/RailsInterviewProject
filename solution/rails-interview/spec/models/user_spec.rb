require "rails_helper"

describe User, type: :model do 
  let(:user) { FactoryGirl.create(:user) }

  it "has a valid factory" do 
    expect(user).to be_valid
  end

end