module SessionHelpers
  include Warden::Test::Helpers

  def sign_in(user)
    TestShibbolethHeaders.user = user.email
  end

  def sign_out
    TestShibbolethHeaders.user = nil
  end
end

RSpec.configure do |config|
  config.include SessionHelpers, type: :feature
  config.include SessionHelpers, type: :request
end
