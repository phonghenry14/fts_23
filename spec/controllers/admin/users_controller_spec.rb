require "rails_helper"

RSpec.describe Admin::UsersController, type: :controller do
  before :each do
    @admin_user = FactoryGirl.create :user, role: "admin"
    @other_user = FactoryGirl.create :user, role: "normal"
    sign_in @admin_user
  end

  describe "GET #index" do
    it "should response to show user" do
     get :index
      expect(response).to render_template "index"
    end
  end

  describe "GET #show" do
    it "should response to display user information" do
      get :show, id: @other_user.id
      expect(response).to render_template "show"
    end
  end

  describe "DELETE #destroy" do
    it "should response index page after delete user" do
      delete :destroy, id: @other_user.id
      expect(response).to redirect_to admin_users_path
    end
  end
end
