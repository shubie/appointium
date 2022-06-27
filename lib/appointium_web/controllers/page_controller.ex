defmodule AppointiumWeb.PageController do
  use AppointiumWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
