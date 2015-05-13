require "rails_helper"

RSpec.describe User, type: :model do
  describe "test valid" do
    context "Email is existed" do
      before do
        FactoryGirl.create(:user, email: "phong@gmail.com", password: "12345678")
      end
      let(:user){FactoryGirl.build(:user, email: "phong@gmail.com", password: "11111111111")}
      it {expect(user).to be_invalid}
    end

    context "password less than 8 character" do
      let(:user){FactoryGirl.build(:user, email: "phong@gmail.com", password: "111")}
      it {expect(user).to be_invalid}
    end
  end
end
