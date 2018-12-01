defmodule StudyShop.Repo do
  use Ecto.Repo,
    otp_app: :study_shop,
    adapter: Ecto.Adapters.Postgres
end
