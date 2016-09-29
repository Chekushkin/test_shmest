class Account < ActiveRecord::Base
  belongs_to :login
  has_many :transactions, dependent: :destroy
end
