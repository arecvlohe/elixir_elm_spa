defmodule FunctionalSuncoastWeb.PageController do
  use FunctionalSuncoastWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
