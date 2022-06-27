defmodule Appointium.Repo do
  use Ecto.Repo,
    otp_app: :appointium,
    adapter: Ecto.Adapters.Postgres
end
