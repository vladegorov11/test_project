require 'rails_helper'

RSpec.describe NotificationTemplate, type: :model do
  describe "validation tests " do
    it { should validate_presence_of(:name) }
  end

  describe "association tests " do
    it { should belong_to(:role) }
  end
end
