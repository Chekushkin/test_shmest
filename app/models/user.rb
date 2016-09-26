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
    send_request(self)
  end

  has_many :accounts, dependent: :destroy

  def send_request(user)
    api  = Saltedge.new("qYAUAjxz1zB0PqL5viGTwA", "hzzvj4DSgL_HGojGDtQAjp_PtWejH6RKWsjObweYd6o", "./config/private.pem")
    data = JSON.parse(
      api.request(
        "POST",
        "https://www.saltedge.com/api/v3/customers/",
        {"data" => {"identifier" => user[:email]}}
      )
    ).with_indifferent_access

    data = data[:data]
    user[:spectre_id] = data[:id]
    user[:identifier] = data[:identifier]
    user[:secret]     = data[:secret]
  end
end
