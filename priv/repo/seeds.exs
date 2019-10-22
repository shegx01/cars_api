# db seed
alias CarsApi.Data.Schema.Cars

lists =
  CarsApi.Tools.GenerateNewDataset.transform_elixir_map_struct(
    "/home/shegx01/Desktop/cars_api/cars_api/items.bin"
  )

remove_nil = fn map_item, item_key, value ->
  case Map.get(map_item, item_key) do
    nil ->
      Map.put(map_item, item_key, value)

    _ ->
      map_item
  end
end

Enum.each(lists, fn car ->
  with car_not_nil <- remove_nil.(car, "image_count", 0),
       price <- Map.get(car_not_nil, "base_price", 0),
       car_with_price <- %{car_not_nil | "base_price" => round(price)} do
    car_with_img =
      case Map.get(car_with_price, "image_count") do
        0 ->
          Map.put(
            car_with_price,
            "image",
            "https://img2.carmax.com/content/images/ComingSoon.jpg?width=1200&quality=80&mode=crop&height=300"
          )

        _ ->
          %{"stock_number" => stock_number} = car_with_price

          Map.put(
            car_with_price,
            "image",
            "https://img2.carmax.com/img/vehicles/#{stock_number}/1.jpg?&width=1200"
          )
      end

    Cars.changeset(%Cars{}, car_with_img) |> CarsApi.Repo.insert!()
  end

  # replace nil value with 0
end)
