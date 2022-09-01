defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory
  import Mox

  alias Rockelivery.ViaCep.ClientMock
  alias RockeliveryWeb.Auth.Guardian

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "address" => "Rua das bananeiras",
        "age" => 26,
        "cep" => "12345678",
        "cpf" => "12345678910",
        "email" => "bruno@teste.com",
        "password" => "123456",
        "name" => "Bruno Reis"
      }

      expect(ClientMock, :get_cep_info, fn _cep ->
        {:ok, build(:cep_info)}
      end)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "Rua das bananeiras",
                 "age" => 26,
                 "cep" => "12345678",
                 "cpf" => "12345678910",
                 "email" => "bruno@teste.com",
                 "id" => _id,
                 "name" => "Bruno Reis"
               }
             } = response
    end

    test "where there are some error, returns the error", %{conn: conn} do
      params = %{
        "password" => "123456",
        "name" => "Bruno Reis"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert response === expected_response
    end
  end

  describe "delete/2" do
    setup %{conn: conn} do
      user = insert(:user)
      {:ok, token, _claims} = Guardian.encode_and_sign(user)
      conn = put_req_header(conn, "authorization", "Bearer #{token}")
      {:ok, conn: conn}
    end

    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "add2ec5e-67f3-4b9f-b6f8-67f9d195b7fb"

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response === ""
    end
  end
end
