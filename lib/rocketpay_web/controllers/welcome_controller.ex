defmodule RocketpayWeb.WelcomeController do
  use RocketpayWeb, :controller

  def index  conn, _params do
    text(conn, "Welcome to RocketPay API")
  end
end
