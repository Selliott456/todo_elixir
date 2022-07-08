defmodule TodoApiWeb.FallbackController do
  use TodoApiWeb, :controller

  # weird fix - code example said {:error, %Ecto.Changeset{} = changeset}
  def call(conn, {:error, :changeset = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(TodoApiWeb.ChangesetView)
    |> render("error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(TodoApiWeb.ErrorView)
    |> render(:"404")
  end
end
