defmodule SinergyDemoWeb.PageController do
  use SinergyDemoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
