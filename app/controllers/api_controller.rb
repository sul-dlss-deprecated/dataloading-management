# Base controller for API controllers
class ApiController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate
  respond_to :json

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, _options|
      # NOTE: We can inject the value of `API_TOKEN` via vault lookup in puppet
      ActiveSupport::SecurityUtils.secure_compare(token, ENV.fetch("API_TOKEN", ""))
    end
  end
end
