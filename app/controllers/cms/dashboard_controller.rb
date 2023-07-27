class Cms::DashboardController < ApplicationController
  def index
    render layout: "dashboard"
  end
end
