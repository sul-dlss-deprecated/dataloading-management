# StatsController surfaces specific stat values for display
class StatsController < ApplicationController
  before_action :authenticate_user!

  def index
  end
end
