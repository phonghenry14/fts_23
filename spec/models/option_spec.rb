require "rails_helper"

RSpec.describe Option, type: :model do
  before do
    @option = FactoryGirl.build :option
  end

  it "should be valid" do
    expect(@option).to be_valid
  end
end
