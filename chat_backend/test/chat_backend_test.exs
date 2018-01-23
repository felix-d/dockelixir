defmodule ChatBackendTest do
  use ExUnit.Case
  doctest ChatBackend

  test "greets the world" do
    assert ChatBackend.hello() == :world
  end
end
