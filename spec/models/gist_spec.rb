require 'spec_helper'
require 'shoulda/matchers'

describe Gist do
	subject{ build(:gist) }
	describe 'validations' do
		it{ expect(subject).to validate_presence_of(:name) }
		it{ expect(subject).to validate_presence_of(:owner_id) }
		it{ expect(subject).to validate_presence_of(:type_id) }
	end

	describe '#add_challenge' do
		subject{ create(:gist) }

		let(:challenge){ create(:gist) }
		it 'assigns challenge' do
			subject.add_challenge(challenge)

			expect(subject.challenges).to include(challenge)
		end
	end
end