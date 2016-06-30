defmodule Psonix.PageController do
  use Psonix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
