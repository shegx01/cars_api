defmodule CarsApi.Tools.GenerateNewDataset do
  def transform_elixir_map_struct(bin_data) do
    bin_data
    |> decode_bin_to_map
    |> Enum.map(&transform_data/1)
  end

  defp transform_data(map) do
    for {key, value} <- map, into: %{} do
      {Macro.underscore(key), value}
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
end
