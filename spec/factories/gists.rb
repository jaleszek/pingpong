FactoryGirl.define do
  factory :gist do
  	name 'test-name'
  	url 'https://gist.github.com/jaleszek/9772408'
  	owner_id 1
  	type_id 1
  end
end