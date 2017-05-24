require "rails_helper"

describe Tenant, type: :model do 
  let(:tenant) { FactoryGirl.create(:tenant) }

  it "has a valid factory" do 
    expect(tenant).to be_valid
  end

end