defmodule AcmeBankWeb.API.UserRegistrationControllerTest do
  use AcmeBankWeb.ConnCase, async: true

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  @invalid_attrs %{}

  describe "create" do
    test "creates account", %{conn: conn} do
      email = unique_user_email()

      user_params = params_for(:user, email: email, password: valid_user_password())

      response =
        conn
        |> post(~p"/api/users/register", %{"user" => user_params})
        |> json_response(201)
        |> Map.fetch!("data")

      assert %{"email" => ^email} = response
    end

    test "renders errors when data is invalid", %{conn: conn} do
      error_response =
        conn
        |> post(~p"/api/users/register", user: @invalid_attrs)
        |> json_response(422)
        |> Map.fetch!("errors")

      assert error_response == %{"email" => ["can't be blank"], "password" => ["can't be blank"]}
    end
  end
end
