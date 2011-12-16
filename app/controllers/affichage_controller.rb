require 'espeak-ruby'

include ESpeak

class AffichageController < ApplicationController

	def index
		@list_categorie = Images.all
	end

	def create_audio
		espeak("test.mp3", :text => "Hello World")
		@audio = "test.mp3"
		
		respond_to do |format|
			format.html { redirect_to('affichage') }
			format.js
			format.xml {head :ok}
		end
	end

end
