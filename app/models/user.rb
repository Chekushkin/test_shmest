class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  before_validation(on: :create) do
    send_request
  end

  has_many :accounts, dependent: :destroy

  def send_request
    api  = Saltedge.new("qYAUAjxz1zB0PqL5viGTwA", "hzzvj4DSgL_HGojGDtQAjp_PtWejH6RKWsjObweYd6o", "./config/private.pem")
    data = JSON.parse(
      api.request(
        "POST",
        "https://www.saltedge.com/api/v3/customers/",
        {"data" => {"identifier" => self[:email]}}
      )
    ).with_indifferent_access

    data = data[:data]
    self[:spectre_id] = data[:id]
    self[:identifier] = data[:identifier]
    self[:secret]     = data[:secret]
  end
end
