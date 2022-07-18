defmodule Rockelivery.Users.Update do
  alias Ecto.Changeset
  alias Rockelivery.{Error, Repo, User}

  def call(%{"id" => id} = params) do
    with %User{} = user <- Repo.get(User, id),
         %Changeset{} = user <- User.changeset(user, params) do
      Repo.update(user)
    else
      nil -> {:error, Error.build_user_not_found_error()}
    end
  end
end
