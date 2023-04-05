# Parent controller for all UI interactions (not API interactions which inherit from ApiController)
class ApplicationController < ActionController::Base
  include DeviseRemoteUser::ControllerBehavior

  before_action :authenticate_user!
end
