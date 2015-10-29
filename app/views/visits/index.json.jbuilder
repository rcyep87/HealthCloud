json.array!(@visits) do |visit|
  json.extract! visit, :id, :physician_first, :physician_last, :dos, :reason_for_visit, :diagnosis, :dr_notes, :user_id
  json.url visit_url(visit, format: :json)
end
