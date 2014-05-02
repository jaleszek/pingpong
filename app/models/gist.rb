class Gist < ActiveRecord::Base
	validates :url, presence: true, uniqueness: true
	validates_format_of :url, with: /\Ahttps:\/\/gist.github.com\/\w+\/\d+\z/
	validates :type_id, presence: true
	validates :owner_id, presence: true
	validates :name, presence: true

	def type
		# naming colision
	end
end
