require "rails_helper"

RSpec.describe RolesController, type: :controller do
  let(:user) { create :user }
  let(:role) { create :role }
  let(:name) { 'role first' }
  let(:params) {  { name: name }  }
  before { sign_in user }

  describe "#index" do
    it "success" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#new" do
    it "success" do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#edit" do
    it "success" do
      get :edit, params: { id: role.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#show" do
    it "success" do
      get :show, params: { id: role.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#create" do

    context "success" do
      let(:name) { 'first role' }

      it do
        expect {
          post :create, params: { role: params }
          expect(response).to have_http_status(:found)
        }.to change { Role.count }.by(1)
      end
    end

    context "error" do
      let(:name) { "" }

      it do
        expect {
          post :create, params: { role: params }
          expect(response).to have_http_status(:ok)
        }.not_to change { Role.count }
      end
    end
  end

  describe "#update" do

    context "success" do
      let(:name) { 'new name' }

      it do
        expect {
          patch :update, params: { role: params, id: role.id }
          expect(response).to have_http_status(:found)
        }.to change { role.reload.name }.to(name)
      end
    end

    context "error" do
      let(:name) { "" }

      it do
        expect {
          patch :update, params: { role: params, id: role.id }
          expect(response).to have_http_status(:ok)
        }.not_to change { role.reload.name }
      end
    end
  end
end
