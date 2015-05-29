require "rails_helper"

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.build :user
  end

  it "should is valid" do
    expect(@user).to be_valid
  end

  context "Email" do
    it "should invalid when empty" do
      @user.email = nil
      expect(@user).not_to be_valid
    end

    it "should be uniqueness" do
      @user.email = "phonghenry@gmail.com"
      @user.save
      other_user = FactoryGirl.build :user
      other_user.email = "phonghenry@gmail.com"
      expect(other_user).not_to be_valid
    end

    it "should invalid when wrong format" do
      @user.email = "phonghenry.com"
      expect(@user).not_to be_valid
    end

    it "should down-case after save" do
      @user.email = "PhongHenry@gmail.com"
      @user.save
      expect(@user.email).to eql "phonghenry@gmail.com"
    end
  end

  context "Password" do
    it "should invalid when minimum length smaller than 8" do
      @user.password = "123"
      expect(@user).not_to be_valid
    end
  end
end
