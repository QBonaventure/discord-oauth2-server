use Mix.Config

config :discord_oauth2_server,
  client_id: System.get_env("DISCORD_CLIENT_ID"),
  client_secret: System.get_env("DISCORD_CLIENT_SECRET"),
  redirect_uri: ""

config :discord_oauth2_server, db: [
  pool: DBConnection.Poolboy,
  pool_size: 10,
  database: System.get_env("DB_NAME"),
  types: DiscordOauth2Server.PostgrexTypes,
  hostname: System.get_env("DB_HOSTNAME"),
  username: System.get_env("DB_USERNAME"),
  password: System.get_env("DB_PASSWORD")
]

config :discord_oauth2_server, DiscordOauth2Server.TokenModule,
  allowed_algos: ["ES512"],
  verify_module: Guardian.JWT,
  issuer: "",
  ttl: { 1, :days },
  allowed_drift: 2000,
  verify_issuer: true,
  secret_key: %{}

import_config "local.exs"
