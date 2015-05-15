require "rails_helper"

RSpec.describe "admin/users/index.html.erb", type: :view do
  context "displays search user correctly" do
    before do
      assign(:users, [
        FactoryGirl.create(:user, email: "phong1@gmail.com"),
        FactoryGirl.create(:user, email: "phong2@gmail.com")
      ])
      assign(:search, User.search(params[name_cont: "phong"]))

    end

    it do
      render
      expect(rendered).to include("phong")
    end
  end
end
