defmodule CarsApi.Tools.PopulateDb do
  def to_pascal_case(word) do
    word
    |> convert_to_pascal()
  end

  defp convert_to_pascal(word) do
    pattern = ~r/[A-Z]/

    case Regex.scan(pattern, word) do
      [] ->
        word

      deep_map ->
        str = "_" <> (deep_map |> :lists.flatten() |> to_string() |> String.downcase())
        [a, b] = String.split(word, pattern)
        a <> str <> b
    end
  end
end
