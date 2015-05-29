require "rails_helper"

RSpec.describe Answer, type: :model do
  before do
    @answer = FactoryGirl.build :answer
  end

  it "should be valid" do
    expect(@answer).to be_valid
  end
end
