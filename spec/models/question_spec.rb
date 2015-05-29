require "rails_helper"

RSpec.describe Question, type: :model  do
  before do
    @question = FactoryGirl.build :question
  end

  it "should be valid" do
    expect(@question).to be_valid
  end

  context "Asscociation with Option" do
    it "should have many options" do
      @question = FactoryGirl.create :question_with_options
      expect(@question.options.count).to eql 4
    end
  end
end
