require_relative "boot"

# Pick the frameworks you want:
require "action_cable/engine"
require "action_controller/railtie"
# require "action_mailbox/engine"
require "action_mailer/railtie"
# require "action_text/engine"
require "action_view/railtie"
require "active_job/railtie"
require "active_model/railtie"
require "active_record/railtie"
require "active_storage/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DataloadingManagement
  class Application < Rails::Application
    # Wire up JSON API error responses for Committee API validation
    class JSONAPIError < Committee::ValidationError
      def error_body
        {
          errors: [
            {
              status: id,
              detail: message
            }
          ]
        }
      end
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Use Committee gem for request validation
    config.middleware.use(
      Committee::Middleware::RequestValidation,
      schema_path: "openapi.yml",
      strict: true,
      error_class: JSONAPIError,
      strict_reference_validation: true,
      accept_request_filter: proc { |req| req.path.start_with?(%r{/v\d+/}) }
    )

    # Use Committee gem for response validation
    config.middleware.use(
      Committee::Middleware::ResponseValidation,
      schema_path: "openapi.yml",
      strict_reference_validation: true
    )

    # Set default URL options (required by Devise)
    config.action_mailer.default_url_options = {host: Settings.host}

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
