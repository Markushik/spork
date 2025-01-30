defmodule SporkTest do
  use ExUnit.Case
  doctest Spork

  test "greets the world" do
    assert Spork.hello() == :world
  end
end
