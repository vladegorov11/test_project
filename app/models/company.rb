class Company < ApplicationRecord
  has_many :user_companies, dependent: :destroy
  has_many :users, through: :user_companies
  belongs_to :role
  acts_as_taggable_on :locations

  validates :name, presence: true
end
