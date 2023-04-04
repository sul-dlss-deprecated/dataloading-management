# Configure folio_client singleton
begin
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
rescue => e
  # folio_client tries to connect immediately upon configuration, which would
  # prevent running tests or rails console on laptop.  would also prevent deployment or startup
  # of the app if configuration was incorrect (missing settings, stale password, etc).
  Rails.logger.warn("Error configuring FolioClient: #{e}")
  Honeybadger.notify(e) if defined?(Honeybadger)
end
