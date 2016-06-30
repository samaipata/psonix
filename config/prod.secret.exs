use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :psonix, Psonix.Endpoint,
  secret_key_base: "8Ao4lJTZRrgE1RIzbWG5ajCzJjy/67fec0US4z2t7kWIk1lidd4Ud3UGu/oADRJw"

# Configure your database
config :psonix, Psonix.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "psonix_prod",
  pool_size: 20
