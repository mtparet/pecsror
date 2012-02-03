require 'espeak-ruby'

include ESpeak

class AffichageController < ApplicationController

	def index
		@list_categorie = Images.all
		@audio = "test2.mp3"
		@@phrase = "initial"
	end

	def create_audio
		espeak("public/test2.mp3", :text => @@phrase, :voice => "fr")
		@audio = "test2.mp3"

		respond_to do |format|
			format.js
		end

	end

	def create_phrase
		@@phrase = params[:phrase]

		respond_to do |format|
			format.html 
		end

	end

end
