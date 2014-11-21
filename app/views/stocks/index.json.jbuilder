json.array!(@stocks) do |stock|
  json.extract! stock, :id, :ticker
  json.url stock_url(stock, format: :json)
end
