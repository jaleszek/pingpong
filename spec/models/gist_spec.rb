require 'spec_helper'
require 'shoulda/matchers'

describe Gist do
	subject{ build(:gist) }
	describe 'validations' do
		it{ expect(subject).to validate_presence_of(:url) }
		it{ expect(subject).to validate_uniqueness_of(:url)}
		it{ expect(subject).to validate_presence_of(:name) }
		it{ expect(subject).to validate_presence_of(:owner_id) }
		it{ expect(subject).to validate_presence_of(:type_id) }

		describe 'url' do
			it 'has valid Github gist format' do
				expect(subject).to be_valid
				valid_url = subject.url
				invalid_url = "#{valid_url}.js"
				subject.url = invalid_url
				expect(subject).to_not be_valid
				subject.url = 'abcabcbaba'
				expect(subject).to_not be_valid
			end
		end
	end
end