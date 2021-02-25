defmodule RocketpayWeb.AccountsView do

  alias Rocketpay.{Account}

  def render("update.json", %{
    account: %Account{id: id, balance: balance}
  }) do
    %{
      message: "Ballance changed successfully",
      account: %{
        id: id,
        balance: balance
      }
    }
  end

  def render("transaction.json", %{
    transaction: %{to_account: to_account, from_account: from_account}
  }) do
    %{
      message: "Transaction done successfully",
      transaction: %{
        from_account: %{
          id: Map.get(from_account, :id),
          balance: Map.get(from_account, :balance)
        },
        to_account: %{
          id: Map.get(to_account, :id),
          balance: Map.get(to_account, :balance)
        }
      }
    }
  end
end
