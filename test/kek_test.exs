defmodule KekTest do
  use ExUnit.Case
  doctest Kek

  test "greets the world" do
    assert Kek.hello() == :world
  end
end
