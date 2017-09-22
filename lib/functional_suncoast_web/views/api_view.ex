defmodule FunctionalSuncoastWeb.ApiView do
  use FunctionalSuncoastWeb, :view

  def render("index.json", _params) do
    %{ hello: "world" }
  end

end
