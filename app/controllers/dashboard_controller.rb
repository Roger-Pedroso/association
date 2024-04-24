class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    dashboard_service = DashboardService.new(current_user)
    @dashboard_data = dashboard_service.dashboard_data

  end
end
