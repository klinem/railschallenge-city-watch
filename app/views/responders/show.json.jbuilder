json.responder do
  json.(@responder, :name, :type, :capacity, :on_duty, :emergency_code)
end
