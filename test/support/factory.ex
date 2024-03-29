defmodule Rockelivery.Factory do
  # Aqui serve para usarmos o ExMachina com as propriedades para conversar com nosso banco
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      "address" => "Rua das bananeiras",
      "age" => 26,
      "cep" => "12345678",
      "cpf" => "12345678910",
      "email" => "bruno@teste.com",
      "password" => "123456",
      "name" => "Bruno Reis"
    }
  end

  def user_factory do
    %User{
      address: "Rua das bananeiras",
      age: 26,
      cep: "12345678",
      cpf: "12345678910",
      email: "bruno@teste.com",
      password: "123456",
      name: "Bruno Reis",
      id: "add2ec5e-67f3-4b9f-b6f8-67f9d195b7fb"
    }
  end

  def cep_info_factory do
    %{
      "bairro" => "Sé",
      "cep" => "01001-000",
      "complemento" => "lado ímpar",
      "ddd" => "11",
      "gia" => "1004",
      "ibge" => "3550308",
      "localidade" => "São Paulo",
      "logradouro" => "Praça da Sé",
      "siafi" => "7107",
      "uf" => "SP"
    }
  end
end
