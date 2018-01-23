defmodule Chat.Resolver do
  def resolve(hostname) do
    {:ok, {_, _, _, _, _, [{a, b, c, d}]}} = :inet_res.gethostbyname(to_charlist(hostname))
    "node@#{a}.#{b}.#{c}.#{d}" |> String.to_atom
  end
end
