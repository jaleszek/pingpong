json.array!(@gists) do |gist|
  json.extract! gist, :id, :name, :url, :owner_id, :type
  json.url gist_url(gist, format: :json)
end
