defmodule MapSet.Typing do
  @moduledoc """
  Documentation for MapSet.Typing.
  """

  @whitelisted_keys [
                      :__struct__,
                      "absinthe.field.file",
                      "absinthe.field.module",
                      "absinthe.field.name",
                      "absinthe.field.type",
                      "code.file",
                      "code.function",
                      "code.module",
                      "message"
                    ]
                    |> Enum.map(&to_string/1)
                    |> Enum.map(&String.downcase/1)
                    |> MapSet.new()

  @doc """
  Determine whether a key is whitelisted to _not_ be automatically encrypted.

      iex> whitelisted?("password")
      false

      iex> whitelisted?("message")
      true

  _Please_ don't interpolate any PII into `message`.
  """
  @spec whitelisted?(atom() | binary()) :: boolean()
  def whitelisted?(key)

  def whitelisted?(key) when is_atom(key), do: key |> to_string() |> whitelisted?()

  def whitelisted?(key) when is_binary(key),
    do: MapSet.member?(whitelisted_keys(), String.downcase(key))

  def whitelisted?(_), do: false

  @spec whitelisted_keys() :: MapSet.t()
  defp whitelisted_keys, do: @whitelisted_keys
end
