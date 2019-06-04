class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :invitable
   acts_as_taggable_on :locations
   has_many :user_companies, dependent: :destroy
   has_many :companies, through: :user_companies
   belongs_to :role

   validates :name, presence: true, uniqueness: true
end
