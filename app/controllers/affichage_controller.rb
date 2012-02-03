require 'espeak-ruby'

include ESpeak

class AffichageController < ApplicationController

	def index
		@list_categorie = Images.all
		@audio = "test.mp3"
		@phrase = "initial"
	end

	def create_audio
		espeak("public/test2.mp3", :text => @phrase)
		@audio = "test2.mp3"

		respond_to do |format|
			format.js 
		end

	end

	def create_phrase
		@phrase = params[:phrase]

	end

end
