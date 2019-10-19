# db seed
# alias CarsApi.Repo
# alias CarsApi.Data.Schema.Cars
# import Ecto.Changeset only: [change: 2]

lists =
  CarsApi.Tools.GenerateNewDataset.transform_elixir_map_struct(
    "/home/shegx01/Desktop/cars_api/cars_api/items.bin"
  )

Enum.each(lists, fn car ->
  with price <- Map.get(car, "base_price", 0),
       new_map <- %{car | "base_price" => Money.new(round(price))},
       changeset <- CarsApi.Data.Schema.Cars.changeset(%CarsApi.Data.Schema.Cars{}, new_map) do
    CarsApi.Repo.insert!(changeset)
  end
end)
