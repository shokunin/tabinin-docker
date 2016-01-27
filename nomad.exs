use Mix.Config
config :tabinin, Tabinin.Nomad,
  server: "#{System.get_env("NOMAD_API")}",
  name: "#{System.get_env("NOMAD_CLUSTER")}"

