class SpectreCallbacksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def success
    2000.times { print "zalupa" }
  end

  def fail
  end
end
