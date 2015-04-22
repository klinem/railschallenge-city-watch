json.responders do
  json.array! @responders do |responder|
    json.(responder, :name, :type, :capacity, :on_duty, :emergency_code)
  end
end
