require "rails_helper"

RSpec.describe Admin::UsersController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to be_success
    end
  end
end
