json.extract! @gist, :id, :name, :url, :owner_id, :type, :created_at, :updated_at, :normalized


json.challenges @gist.challenges do |challenge|
  json.normalized challenge.normalized
end