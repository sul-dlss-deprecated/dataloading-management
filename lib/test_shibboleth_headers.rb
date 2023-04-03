# This is a Rack middleware that we use in testing. It injects headers
# that simulate mod_shib so we can test.
class TestShibbolethHeaders
  class_attribute :user

  def initialize(app)
    @app = app
  end

  def call(env)
    env["REMOTE_USER"] = user
    @app.call(env)
  end
end
