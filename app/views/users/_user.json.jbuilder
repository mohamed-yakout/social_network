json.extract! user, :id, :name, :original_url, :shorten_url, :created_at, :updated_at
json.url user_url(user, format: :json)
