class ApplicationController < ActionController::Base
  include DeviseRemoteUser::ControllerBehavior
end
