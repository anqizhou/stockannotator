json.array!(@stock_trackers) do |stock_tracker|
  json.extract! stock_tracker, :id, :name, :ticker
  json.url stock_tracker_url(stock_tracker, format: :json)
end
