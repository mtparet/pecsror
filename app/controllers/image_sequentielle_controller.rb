require 'espeak-ruby'

include ESpeak

class ImageSequentielleController < ApplicationController
	def index
		@list_sequence = Sequence.all
    @sequence = Sequence.where(:name => "initial").first
	end

  def display_sequence
    @sequence = Sequence.where(:name => params[:sequence_name]).first
    
    respond_to do |format|
			format.js
		end
  end

  	def create_audio
		@phrase_s = @@phrase.join(" ")
		espeak("public/test2.mp3", :text => @phrase_s, :voice => "fr")
		@audio = "test2.mp3"

		respond_to do |format|
			format.js
		end

	end
end
