require "rails_helper"

RSpec.describe UsersController, type: :controller do
  before :each do
    @user = FactoryGirl.create :user, role: "admin"
    sign_in @user
  end

  describe "GET #show" do
    it "should response to display user information" do
      get :show, id: @user.id
      expect(response).to render_template "show"
    end
  end
end
