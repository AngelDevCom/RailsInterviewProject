require "rails_helper"

describe Answer, type: :model do 
  let(:answer) { FactoryGirl.create(:answer) }

  it "has a valid factory" do 
    expect(answer).to be_valid
  end

end