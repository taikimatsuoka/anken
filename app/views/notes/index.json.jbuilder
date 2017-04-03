json.array!(@notes) do |note|
  json.extract! note, :id, :user, :sales_company, :end_user, :delivery_day, :content
  json.url note_url(note, format: :json)
end
