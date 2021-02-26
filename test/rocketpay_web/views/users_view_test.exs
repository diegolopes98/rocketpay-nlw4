defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true

  alias Rocketpay.{Account, User}

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders create.json" do
    params = %{
      name: "Test",
      password: "test123",
      nickname: "testtest",
      email: "test@mail.com",
      age: 18
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} = Rocketpay.create_user(params)

    response = render(RocketpayWeb.UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{balance: Decimal.new("0.00"), id: account_id},
        id: user_id,
        name: "Test",
        nickname: "testtest"
      }
    }

    assert response == expected_response
  end

end
