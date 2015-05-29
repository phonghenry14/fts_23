require "rails_helper"

RSpec.describe Course, type: :model do
  before do
    @course = FactoryGirl.build :course
  end

  it "should be valid" do
    expect(@course).to be_valid
  end

  it "should invalid when name is empty" do
    @course.name = nil
    expect(@course).not_to be_valid
  end
end
