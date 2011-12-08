class AffichageController < ApplicationController

	def index
		@list_categorie = Images.all
	end

end
