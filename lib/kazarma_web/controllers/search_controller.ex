defmodule KazarmaWeb.SearchController do
  use KazarmaWeb, :controller

  plug :halt_if_disabled

  def search(conn, %{"search" => %{"address" => address}}) do
    case Kazarma.search_user(address) do
      {:ok, actor} ->
        actor_path = Routes.activity_pub_path(conn, :actor, actor.username)
        redirect(conn, to: actor_path)

      _ ->
        conn
        |> put_flash(:error, gettext("User not found"))
        |> redirect(to: Routes.index_path(conn, :index))
    end
  end

  defp halt_if_disabled(conn, _opts) do
    unless Application.get_env(:kazarma, :html_search, false) do
      conn |> redirect(to: "/") |> halt()
    else
      conn
    end
  end
end
