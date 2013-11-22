json.array!(@units) do |unit|
  json.extract! unit, :name, :type, :lat, :lng, :speed, :course, :height, :status
  json.url unit_url(unit, format: :json)
end