DeviseRemoteUser.configure do |config|
  config.env_key = lambda do |env|
    if (Rails.env.development? || Rails.env.test?) && (remote_user = ENV.fetch("REMOTE_USER", nil))
      remote_user
    else
      # Return the value of the remote user header or return nil (unauthenticated)
      env.to_h["REMOTE_USER"].presence
    end
  end
  config.logout_url = "/Shibboleth.sso/Logout"
  config.auto_create = true
  config.auto_update = true
end
