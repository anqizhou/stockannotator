json.array!(@prices) do |price|
  json.extract! price, :id, :close_date, :close_price
  json.url price_url(price, format: :json)
end
