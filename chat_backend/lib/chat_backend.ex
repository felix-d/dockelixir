defmodule ChatBackend do
  alias ChatBackend.Server

  @type message :: binary

  @spec add_message(message) :: :ok | {atom, term}
  def add_message(message) do
    GenServer.call(Server, {:add_message, message})
  end

  @spec get_messages :: [message]
  def get_messages do
    GenServer.call(Server, :get_messages)
  end
end
