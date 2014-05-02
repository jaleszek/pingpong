module GistsHelper
	def embed_gist(gist)
		"<script src='#{gist.url}.js'></script>"
	end
end
