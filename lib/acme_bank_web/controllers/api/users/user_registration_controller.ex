defmodule AcmeBankWeb.API.UserRegistrationController do
  use AcmeBankWeb, :controller

  alias AcmeBank.Contexts.Accounts

  alias AcmeBankWeb.API.UserJSON

  action_fallback AcmeBankWeb.FallbackController

  def create(_conn, %{"user" => user_params}) do
    with {:ok, user} <- Accounts.register_user(user_params) do
      {:ok, _} =
        Accounts.deliver_user_confirmation_instructions(
          user,
          &url(~p"/users/confirm/#{&1}")
        )

      {:created, "/", UserJSON, :show, user: user}
    end
  end
end
