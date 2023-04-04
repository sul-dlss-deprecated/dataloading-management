# frozen_string_literal: true

# Configure folio_client singleton
begin
  if !Rails.env.test?
    FolioClient.configure(
      url: Settings.folio.url,
      login_params: {
        username: Settings.folio.username, password: Settings.folio.password
      },
      okapi_headers: {
        "X-Okapi-Tenant": Settings.folio.tenant_id,
        "User-Agent": "folio_client #{FolioClient::VERSION}; dataloading-management #{Rails.env}"
      }
    )
  end
rescue FolioClient::Error => e
  # as of v0.1.0, folio_client tries to connect immediately upon configuration, which would
  # prevent running tests or rails console on laptop.  would also prevent deployment or startup
  # of dor-services-app if configuration was incorrect (missing settings, stale password, etc).
  helpful_message = "You can avoid this by using RAILS_ENV=test"
  Rails.logger.warn("Error configuring FolioClient: #{e} - #{helpful_message}}")
  Honeybadger.notify(e, context: {helpful_message: helpful_message})
end
