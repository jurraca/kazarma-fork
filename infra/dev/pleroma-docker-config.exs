import Config

config :pleroma, Pleroma.Web.Endpoint,
  url: [host: System.get_env("DOMAIN", "localhost"), scheme: "http", port: 80],
    http: [ip: {0, 0, 0, 0}, port: 4000]

config :pleroma, :instance,
  federating: true,
  registrations_open: true

config :pleroma, Pleroma.Captcha,
  enabled: false

config :logger, :console, level: :info
config :logger, :ex_syslogger, level: :info