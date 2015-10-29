json.array!(@sleeps) do |sleep|
  json.extract! sleep, :id, :minutes, :user_id
  json.url sleep_url(sleep, format: :json)
end
