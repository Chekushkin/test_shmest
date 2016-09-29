class Login < ActiveRecord::Base
  belongs_to :user
  has_many :accounts, dependent: :destroy
end
