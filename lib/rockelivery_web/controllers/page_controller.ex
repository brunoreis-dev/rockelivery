defmodule RockeliveryWeb.PageController do
  use RockeliveryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
