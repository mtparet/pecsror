require 'espeak-ruby'
require 'fileutils'
include ESpeak

class ImageSequentielleController < ApplicationController
	def index
		@list_sequence = Sequence.all
    @sequence = Sequence.where(:name => "initial").first
    @image_smiley_good = Image.where(:name => "smiley_good").first
    @image_smiley_bad = Image.where(:name => "smiley_bad").first
	end

  def display_sequence
    @sequence = Sequence.where(:name => params[:sequence_name]).first
    
    @tab_correct = @sequence.sequence_liste.order("order_sequence").select{ |i| !i.order_sequence.nil?}.map{|i| i.image.name}
    
    respond_to do |format|
			format.js
		end
  end

  def display_sequence_all

  end

  def create_audio
		@phrase_s = @@phrase.join(" ")
		espeak("public/test2.mp3", :text => @phrase_s, :voice => "fr")
		@audio = "test2.mp3"

		respond_to do |format|
			format.js
	  end
	end

  def new 
  end

  def create
  end
end
