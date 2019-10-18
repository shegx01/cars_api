defmodule Generate.New.Dataset do
  alias CarsApi.Tools.PopulateDb

  def transform_elixir_map_struct(list) do
    list
   |> Enum.reduce(%{}, &transform_data/2)
  end

  defp transform_data({key, value}, map) do
    Map.put(map, convert_key(key), value)

  end

  defp convert_key(key) do
    key
    |> PopulateDb.to_pascal_case()
    |>String.to_atom()
  end
  def decode_bin(bin_file_path) do
    bin_file_path
    |> decode_bin_file
  end
  defp decode_bin_file(path) do
    with {:ok, binary} <- File.read(path),
         {:ok, file} <- :erlang.binary_to_term(binary) do
      file
      |> String.replace("\n", "")
      |> Jason.decode()
    end
  end
end
