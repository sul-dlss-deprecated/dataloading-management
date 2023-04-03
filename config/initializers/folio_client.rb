# frozen_string_literal: true

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
