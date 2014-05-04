class GistContent < ActiveRecord::Base
	begin :validations
		validates :normalized, presence: true
		validates :gist_id, presence: true, uniqueness: true
	end

	belongs_to :gist
end