require "rails_helper"

describe Question, type: :model do 
  let(:question) { FactoryGirl.create(:question) }

  it "has a valid factory" do 
    expect(question).to be_valid
  end

end