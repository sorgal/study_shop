defmodule StudyShop.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :middle_name, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :middle_name, :username])
    |> validate_required([:first_name, :last_name, :middle_name, :username])
    |> unique_constraint(:username)
  end
end
