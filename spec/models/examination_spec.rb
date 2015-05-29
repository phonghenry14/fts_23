require "rails_helper"

RSpec.describe Examination, type: :model do
  before do
    @exam = FactoryGirl.build :examination
  end

  it "should be valid" do
    expect(@exam).to be_valid
  end

  it "should has status default to Ready" do
    @exam.save
    expect(@exam.status).to eql "Ready"
  end
end
