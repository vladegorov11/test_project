require 'rails_helper'

RSpec.describe Company, type: :model do
  describe "validation tests " do
    it { should validate_presence_of(:name) }
  end

  describe "association tests " do
    it { should belong_to(:role) }
    it { should have_many(:user_companies).dependent(:destroy) }
    it { should have_many(:users).through(:user_companies) }
  end
end
