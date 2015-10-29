json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :minutes, :user_id
  json.url exercise_url(exercise, format: :json)
end
