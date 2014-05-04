class Gist < ActiveRecord::Base
	# validates :url, presence: true, uniqueness: true
	# validates_format_of :url, with: /\Ahttps:\/\/gist.github.com\/\w+\/\d+\z/
	validates :type_id, presence: true
	validates :owner_id, presence: true
	validates :name, presence: true

	has_one :gist_content

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
end
