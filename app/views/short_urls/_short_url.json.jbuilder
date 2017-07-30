json.extract! short_url, :id, :url, :identifier, :created_at, :updated_at
json.url short_url_url(short_url, format: :json)
