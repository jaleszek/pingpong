class Gist < ActiveRecord::Base
	validates :type_id, presence: true
	validates :owner_id, presence: true
	validates :name, presence: true

	has_one :gist_content
	has_many :gists_challenges, foreign_key: :parent_gist_id
	has_many :challenges, through: :gists_challenges, source: :challenge

	def add_challenge(gist)
		unless challenges.include?(gist) && gist != self
			challenges << gist
		end
	end

	def type
		# naming colision
	end

	def update_content(params)
		if gist_content.present?
			gist_content.update_attributes(normalized: params[:normalized])
		else
			create_gist_content(gist_id: id, normalized: params[:normalized])
		end

	end

	def normalized
		if gist_content.present?
			gist_content.normalized
		else
			nil
		end
	end

	def self.challengable
		# make it better
		taken = GistsChallenge.pluck(:challenge_gist_id)
		table = self.arel_table

		where(table[:id].not_in(taken))
	end

	def self.not_challengable
		taken = GistsChallenge.pluck(:challenge_gist_id)
		table = self.arel_table

		where(table[:id].in(taken))
	end

	def language_sym
		# TODO: implement
		'ruby'
	end

	def url
		# TODO: remove url dependencies
	end

	def formatted
		Pygments.highlight(normalized, lexer: language_sym)
	end

	def challenges
		Gist.not_challengable.limit(3)
	end

	def self.create_with_defaults(args = {})
		creation_args = {
			owner_id: args[:user].try(:id)||1,
			type_id: 1, 
			name: Time.now.to_s
		}

		creation_args = creation_args.merge args.slice(:type_id, :name)
		create creation_args
	end
end
