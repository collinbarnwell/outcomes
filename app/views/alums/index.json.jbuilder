json.array!(@alums) do |alum|
  json.extract! alum, :id
  json.url alum_url(alum, format: :json)
end
