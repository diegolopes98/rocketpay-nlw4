defmodule Rocketpay do
  alias Rocketpay.Users.Create, as: CreateUser
  alias Rocketpay.Accounts.Deposit
  alias Rocketpay.Accounts.Withdraw

  defdelegate create_user(params), to: CreateUser, as: :call
  defdelegate deposit(params), to: Deposit, as: :call
  defdelegate withdraw(params), to: Withdraw, as: :call

end
