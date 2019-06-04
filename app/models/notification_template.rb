class NotificationTemplate < ApplicationRecord
  belongs_to :role
  validates :name, presence: true
end
