json.array!(@outcomes) do |outcome|
  json.extract! outcome, :id
  json.url outcome_url(outcome, format: :json)
end
