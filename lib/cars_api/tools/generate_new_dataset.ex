defmodule CarsApi.Tools.GenerateNewDataset do
  def transform_elixir_map_struct(bin_data) do
    bin_data
    |> decode_bin_to_map
    |> Enum.map(&transform_data/1)
  end

  defp transform_data(map) do
    for {key, value} <- map, into: %{} do
      {convert_to_pascal(key), value}
    end
  end

  defp decode_bin_to_map(path) do
    with {:ok, binary} <- File.read(path),
         {:ok, file} <- :erlang.binary_to_term(binary) do
      file
      |> String.replace("\n", "")
      |> Jason.decode()
    end
  end

  defp convert_to_pascal(word) do
    pattern = ~r/[A-Z]/

    case Regex.scan(pattern, word) do
      [a] ->
        str = "_" <> (a |> to_string() |> String.downcase())
        [first, last] = String.split(word, pattern)
        first <> str <> last

      _ ->
        word
    end
  end
end
