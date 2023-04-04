# Simple controller to handle login and redirect
class LoginController < ApplicationController
  def login
    # Only hit after successful Shibboleth authN, so let warden know the user is copacetic.
    warden.authenticate(scope: :user)

    redirect_back fallback_location: root_url
  end
end
