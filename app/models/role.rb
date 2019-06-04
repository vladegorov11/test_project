class Role < ApplicationRecord
  has_many :users
  has_many :companies
  has_one  :notification_template, dependent: :destroy
  accepts_nested_attributes_for :notification_template

  validates :name, presence: true, uniqueness: true
end
