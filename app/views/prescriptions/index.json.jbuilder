json.array!(@prescriptions) do |prescription|
  json.extract! prescription, :id, :name, :dosage, :frequency, :brand, :date_prescribed, :refill_till, :rx_notes, :user_id
  json.url prescription_url(prescription, format: :json)
end
