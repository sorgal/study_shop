defmodule StudyShopWeb.PageController do
  use StudyShopWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
