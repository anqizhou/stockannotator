json.array!(@annotations) do |annotation|
  json.extract! annotation, :id, :title, :date, :content
  json.url annotation_url(annotation, format: :json)
end
