json.extract! room, :id, :room_num, :created_at, :updated_at
json.url room_url(room, format: :json)
