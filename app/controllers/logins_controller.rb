class LoginsController < ApplicationController
  def new
    api  = Saltedge.new("qYAUAjxz1zB0PqL5viGTwA", "hzzvj4DSgL_HGojGDtQAjp_PtWejH6RKWsjObweYd6o", "./config/private.pem")
    data = JSON.parse(
      api.request(
        "POST",
        "https://www.saltedge.com/api/v3/tokens/create",
        { "data" => {
          "customer_id"              => current_user[:spectre_id],
          "fetch_type"               => "recent",
          "return_to"                => "http://localhost:3000",
          "javascript_callback_type" => "post_message"
          }
        }
      )
    ).with_indifferent_access
    current_user[:token]       = data[:data][:token]
    current_user[:connect_url] = data[:data][:connect_url]
    redirect_to(current_user[:connect_url])
  end

  def show
    binding.pry
  end
end
