require "rails_helper"

RSpec.describe ExaminationsController, type: :controller do
  before do
    @user = FactoryGirl.create :user, role: "normal"
    sign_in @user
    @exam = FactoryGirl.create :examination
  end

  describe "GET #index" do
    it "response to render template index of examination" do
      get :index
      expect(response).to render_template "index"
    end
  end

  describe "GET #show" do
    it "response to show exam page" do
      get :show, id: @exam
      expect(response).to redirect_to root_path
    end
  end
end
