defmodule AcmeBankWeb.API.UserRegistrationControllerTest do
  use AcmeBankWeb.ConnCase, async: true

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  @invalid_attrs %{}

  describe "create" do
    test "creates account", %{conn: conn} do
      email = unique_user_email()

      response =
        conn
        |> post(~p"/api/users/register", %{
          "user" => params_for(:user, email: email, password: valid_user_password())
        })
        |> json_response(201)
        |> Map.fetch!("data")

      assert %{"email" => ^email} = response
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/users/register", user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end
end
