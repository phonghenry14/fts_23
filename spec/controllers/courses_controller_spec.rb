require "rails_helper"

RSpec.describe Admin::CoursesController, type: :controller do
  describe "Test controller" do
    let(:admin) {FactoryGirl.create(:user, role: "admin")}
    let(:course) {FactoryGirl.create(:course)}

    it "POST #create" do
      sign_in admin
      expect{post :create, course: FactoryGirl.attributes_for(:course)}.to change(Course,:count).by(1)
    end

    it "PUT #update" do
      sign_in admin
      put :update, id: course, course: FactoryGirl.attributes_for(:course, name: "Rails")
      expect(assigns(:course).name).to eq "Rails"
    end

    it "GET #index" do
      sign_in admin
      get :index
      expect(response).to be_success
    end

    it "GET #show" do
      sign_in admin
      get :show, id: course
      expect(response).to be_success
    end

    it "DELETE #destoy" do
      sign_in admin
      delete :destroy, id: course
      expect(response).to redirect_to admin_courses_path
    end
  end
end
