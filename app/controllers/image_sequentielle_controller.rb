require 'espeak-ruby'

include ESpeak

class ImageSequentielleController < ApplicationController
	def index
		@list_sequence = Sequence.all
	end
end
