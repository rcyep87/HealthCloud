json.array!(@steps) do |step|
  json.extract! step, :id, :steps_today, :user_id
  json.url step_url(step, format: :json)
end
