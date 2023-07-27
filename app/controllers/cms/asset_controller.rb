require "date"

class Cms::AssetController < ApplicationController
  before_action :check_token

  def index
    begin
      conn = Faraday.new(
        url: Rails.application.credentials.url,
        headers: { "Content-Type" => "application/json" },
      )
      conn.headers["Authorization"] = "Token #{cookies[:token]}"
      response = conn.get("/api/v2/assets.json")
      @result = JSON.parse(response.body)
    rescue => e
      @error = e.message
      redirect_to "/login"
    end
    render layout: "dashboard"
  end

  def detail
    begin
      conn = Faraday.new(
        url: Rails.application.credentials.url,
        headers: { "Content-Type" => "application/json" },
      )
      conn.headers["Authorization"] = "Token #{cookies[:token]}"
      response = conn.get("/api/v2/assets/#{params[:uid]}/data.json")
      @result = JSON.parse(response.body)
    rescue => e
      @error = e.message
      redirect_to "/login"
    end
    render "detail", layout: "dashboard"
  end

  private

  def check_token
    if cookies[:token].nil?
      redirect_to "/login"
    end
  end
end
