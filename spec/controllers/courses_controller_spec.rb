require "rails_helper"

RSpec.describe Admin::CoursesController, type: :controller do
  # routes {::Engine.routes}
  describe "GET #destroy" do
    let(:admin) {FactoryGirl.create(:user, role: "admin")}
    let(:course) {FactoryGirl.create(:course)}

    it "renders the index template" do
      sign_in admin
      get :index
      expect(response).to be_success
    end

    it "renders the index template" do
      sign_in admin
      get :show, id: course
      expect(response).to be_success
    end

    it "renders the index template" do
      sign_in admin
      delete :destroy, id: course
      expect(response).to redirect_to admin_courses_path
    end
  end
end
