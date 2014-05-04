FactoryGirl.define do
  factory :gist_content do
  	normalized "class Foo\n\tdef self.bar\n\tend\nend"
  	gist_id 1
  	language_id 1
  end
end