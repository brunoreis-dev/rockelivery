defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)
    token = "xpto1234"
    response = render(UsersView, "create.json", token: token, user: user)

    assert %{
             message: "User created!",
             token: "xpto1234",
             user: %Rockelivery.User{
               address: "Rua das bananeiras",
               age: 26,
               cep: "12345678",
               cpf: "12345678910",
               email: "bruno@teste.com",
               id: "add2ec5e-67f3-4b9f-b6f8-67f9d195b7fb",
               inserted_at: nil,
               name: "Bruno Reis",
               password: "123456",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
