defmodule ChatBackend.Server do
  use GenServer

  @max_messages 20

  def start_link(_args) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def handle_call({:add_message, message}, _from, state) do
    {:reply, :ok, [message|state] |> Enum.slice(0..@max_messages - 1)}
  end

  def handle_call(:get_messages, _from, state) do
    {:reply, Enum.reverse(state), state}
  end
end
