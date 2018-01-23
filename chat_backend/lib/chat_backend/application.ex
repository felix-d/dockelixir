defmodule ChatBackend.Application do
  use Application
  require Logger

  def start(_type, _args) do
    Logger.info("`#{__MODULE__}` started on node `#{Node.self()}`")

    children = [
      {ChatBackend.Server, []},
    ]

    opts = [strategy: :one_for_one, name: ChatBackend.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
