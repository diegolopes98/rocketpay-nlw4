defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase

  alias Rocketpay.User
  alias Rocketpay.Users.Create

  describe "call/1" do
    test "when all params are valid, returns an user" do
      params = %{
        name: "Test",
        password: "test123",
        nickname: "testtest",
        email: "test@mail.com",
        age: 18
      }

      {:ok, %User{id: user_id}} = Create.call(params)

      user = Repo.get(User, user_id)

      assert %User{id: ^user_id} = user
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Test",
        password: "test123",
        email: "test@mail.com",
        age: 18
      }

      expected_response =  %{
        nickname: ["can't be blank"]
      }

      {:error, changeset } = Create.call(params)

      assert expected_response == errors_on(changeset)
    end
  end
end
