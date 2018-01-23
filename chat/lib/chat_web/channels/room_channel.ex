defmodule ChatWeb.RoomChannel do
  use Phoenix.Channel

  alias Chat.Resolver

  @room "room"

  def join(@room, _params, socket) do
    send(self(), :after_join)
    {:ok, socket}
  end

  def handle_info(:after_join, socket) do
    messages = Resolver.resolve("chat_backend") |> :rpc.call(ChatBackend, :get_messages, [])
    Phoenix.Channel.push(socket, "messages", %{messages: messages})
    {:noreply, socket}
  end

  def handle_in("add_message", %{"message" => message} = payload, socket) do
    Resolver.resolve("chat_backend") |> :rpc.call(ChatBackend, :add_message, [message])
    ChatWeb.Endpoint.broadcast(@room, "message", payload)
    {:noreply, socket}
  end
end
