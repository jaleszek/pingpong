shared_args = [:id, :name, :url, :owner_id, :type, :created_at, :updated_at, :normalized, :formatted]
json.extract! @gist, *shared_args


json.challenges @gist.challenges do |challenge|
  json.extract! challenge, *shared_args
end
