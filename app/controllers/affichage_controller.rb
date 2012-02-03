require 'espeak-ruby'

include ESpeak

class AffichageController < ApplicationController
	
	def index
		@list_categorie = Images.all
		@audio = "test.mp3"
		@@phrase = []
		
	end

	def create_audio
		@phrase_s = @@phrase.join(" ")
		espeak("public/test2.mp3", :text => @phrase_s, :voice => "fr")
		@audio = "test2.mp3"

		respond_to do |format|
			format.js
		end

	end

	def create_phrase
		@phrase_in = params[:phrase]
		#@position = params[:position]
		#logger.info "Person attributes hash: #{@position}"
		@@phrase << @phrase_in

		respond_to do |format|
			format.html 
		end

	end

end
