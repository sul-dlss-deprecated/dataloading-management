# Handle login and redirect---do *not* inherit from ApplicationController, which
# is intended only for UI controllers (i.e., those that require authentication)
class LoginController < ActionController::Base
  # GET /webauth/login
  def login
    # Only hit after successful Shibboleth authN, so let warden know the user is copacetic.
    warden.authenticate(scope: :user)

    redirect_back fallback_location: root_url
  end
end
