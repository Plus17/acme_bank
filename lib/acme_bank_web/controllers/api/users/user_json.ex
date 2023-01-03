defmodule AcmeBankWeb.API.UserJSON do
  @moduledoc false

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%{} = user) do
    %{
      id: user.id,
      email: user.email
    }
  end
end
