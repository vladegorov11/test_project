require 'rails_helper'

RSpec.describe Role, type: :model do
  describe "validation tests " do
    it { should validate_presence_of(:name) }
  end

  describe "association tests " do
    it { should have_many(:companies) }
    it { should have_many(:users) }
    it { should have_one(:notification_template).dependent(:destroy) }
  end
end
