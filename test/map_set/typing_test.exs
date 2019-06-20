defmodule MapSet.TypingTest do
  use ExUnit.Case
  doctest MapSet.Typing

  test "PID" do
    # Just in case someone shoves a PID in the first element of a 2-tuple:
    assert MapSet.Typing.whitelisted?(self()) == false
  end

  test "name" do
    assert MapSet.Typing.whitelisted?("name") == false
  end

  test "code.file" do
    assert MapSet.Typing.whitelisted?("code.file") == true
  end
end
