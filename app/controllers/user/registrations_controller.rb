class Users::RegistrationsController < Devise::RegistrationsController
  def destroy
    binding.pry
  end
end