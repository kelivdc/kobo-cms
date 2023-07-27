class LoginController < ApplicationController
  def index
    render layout: "login"
  end

  def login
    begin
      conn = Faraday.new(
        url: "https://kf.data.sahabatgolkar.com",
        headers: { "Content-Type" => "application/json" },
      )
      conn.headers["Authorization"] = "Basic #{Base64.strict_encode64("#{params[:username]}:#{params[:password]}")}"
      response = conn.get("/token/?format=json")
      if response.status != 200
        flash[:error] = "Invalid Username/Password"
        redirect_to "/login"
      else
        result = JSON.parse(response.body)
        cookies[:token] = { value: result["token"], expires: 1.week.from_now }
        redirect_to "/cms/dashboard"
      end
    rescue => e
      flash[:error] = e.message
      redirect_to "/login"
    end
  end

  def logout
    cookies.delete("token")
    redirect_to "/login"
  end
end
