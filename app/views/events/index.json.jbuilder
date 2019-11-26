json.array! @events, partial: "events/event", as: :event

json.array! @events do |event|
  json.extract! event, :id, :description   
  json.title event.name
  json.color event.color
  json.start event.start_date
  json.end event.end_date
  json.url event_url(event, format: :html) 
end