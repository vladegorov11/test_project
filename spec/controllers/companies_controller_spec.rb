require "rails_helper"

RSpec.describe CompaniesController, type: :controller do
  let(:user) { create :user }
  let(:role) { create :role }
  let(:name) { 'company first' }
  let(:company) {create :company}
  let(:params) {
    {
      name: name,
      user_ids: [user.id],
      location_list: ['new york', 'monte carlo'],
      role_id: role.id
    }
  }
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
      get :edit, params: { id: company.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#show" do
    it "success" do
      get :show, params: { id: company.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe "#create" do

    context "success" do
      let(:name) { 'first name' }

      it do
        expect {
          post :create, params: {  company: params }
          expect(response).to have_http_status(:found)
        }.to change { Company.count }.by(1)
      end
    end

    context "error" do
      let(:name) { '' }

      it do
        expect {
          post :create, params: { company: params }
          expect(response).to have_http_status(:ok)
        }.not_to change { Company.count }
      end
    end
  end

  describe "#update" do

    context "success" do
      let(:name) { 'new name' }

      it do
        expect {
          patch :update, params: { company: params, id: company.id }
          expect(response).to have_http_status(:found)
        }.to change { company.reload.name }.to(name)
      end
    end

    context "error" do
      let(:name) { "" }

      it do
        expect {
          patch :update, params: { company: params, id: company.id }
          expect(response).to have_http_status(:ok)
        }.not_to change { company.reload.name }
      end
    end
  end
end
