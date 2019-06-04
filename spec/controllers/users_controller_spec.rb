require "rails_helper"

RSpec.describe UsersController, type: :controller do
  let(:user) { create :user }
  before { sign_in user }

  describe "#index" do
    it "success" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#show" do
    it "success" do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
