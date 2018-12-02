defmodule StudyShop.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset
  require Logger

  alias StudyShop.Accounts.User

  schema "credentials" do
    field :password, :string
    field :email, :string
    field :salt, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:email, :password, :salt])
    |> generate_salt
    |> generate_hashed_password
    |> validate_required([:email, :password, :salt])
    |> unique_constraint(:email)
  end

  defp generate_salt(changeset) do
    salt = DateTime.to_string(DateTime.utc_now())

    put_change(changeset, :salt, salt)
  end

  defp generate_hashed_password(changeset) do
    hashed_password =
      get_change(changeset, :password)
      |> Kernel.<>(get_change(changeset, :salt))
      |> encrypt_password
      |> Base.encode16

    put_change(changeset, :password, hashed_password)
  end

  defp encrypt_password(raw_value) do
    :crypto.hash(:sha256, raw_value)
  end
end
