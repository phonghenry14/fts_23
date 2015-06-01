require "rails_helper"

RSpec.describe Admin::ExaminationsController, type: :controller do
  before do
    @admin_user = FactoryGirl.create :user, role: "admin"
    sign_in @admin_user
    @exam = FactoryGirl.create :examination
  end

  describe "GET #index" do
    it "response to render template index of examination" do
      get :index
      expect(response).to render_template "index"
    end

    it "should response to root page if user not admin" do
      @other_user = FactoryGirl.create :user, role: "normal"
      sign_out @admin_user
      sign_in @other_user
      get :index
      expect(response).to redirect_to root_path
    end
  end

  describe "GET #show" do
    it "response to show exam page" do
      get :show, id: @exam
      expect(response).to render_template "show"
    end
  end

  describe "DELETE #destoy" do
    it "should delete examination success" do
      delete :destroy, id: @exam
      expect(response).to redirect_to admin_examinations_path
    end
  end
end
