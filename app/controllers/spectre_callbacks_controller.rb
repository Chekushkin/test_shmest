class SpectreCallbacksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def success
  end

  def fail
  end
end
