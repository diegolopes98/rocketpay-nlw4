defmodule RocketpayWeb.AccountsControllerTest do
  use RocketpayWeb.ConnCase, async: true

  alias Rocketpay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Test",
        password: "test123",
        nickname: "testtest",
        email: "test@mail.com",
        age: 18
      }

      {:ok, %User{account: %Account{id: account_id}}} = Rocketpay.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic cm9ja2V0cGF5OnJvY2tldHBheTEyMw==")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, do the deposit", %{conn: conn, account_id: account_id} do
      params = %{ "value" => "50.00"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:ok)

      assert  %{
        "account" => %{
          "balance" => "50.00",
          "id" => _id
          },
        "message" => "Ballance changed successfully"
      } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn, account_id: account_id} do
      params = %{ "value" => "banana"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid deposit value"}
      assert  expected_response == response
    end
  end
end
