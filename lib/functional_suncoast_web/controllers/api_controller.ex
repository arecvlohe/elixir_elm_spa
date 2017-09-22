defmodule FunctionalSuncoastWeb.ApiController do
  use FunctionalSuncoastWeb, :controller

  def index(conn, _params) do
    render conn, "index.json"
  end
end
