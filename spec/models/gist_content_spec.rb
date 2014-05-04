require 'spec_helper'

describe GistContent do
	describe 'validations' do
		subject{ build(:gist_content) }

		it{ expect(subject).to validate_presence_of :normalized }
		it{ expect(subject).to validate_presence_of :gist_id }
		it{ expect(subject).to validate_uniqueness_of(:gist_id)}
	end	
end