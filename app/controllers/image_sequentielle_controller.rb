require 'espeak-ruby'
require 'fileutils'
include ESpeak

class ImageSequentielleController < ApplicationController
	def index
		@list_sequence = Sequence.all
    @sequence_listes = Sequence.where(:name => "initial").first.sequence_liste
    @image_smiley_good = Image.where(:name => "smiley_good").first
    @image_smiley_bad = Image.where(:name => "smiley_bad").first
	end

  def display_sequence
    sequence = Sequence.where(:name => params[:sequence_name]).first
    @sequence_listes = sequence.sequence_liste.select{ |i| !i.order_sequence.nil?}
    @tab_correct = sequence.sequence_liste.order("order_sequence").select{ |i| !i.order_sequence.nil?}.map{|i| i.id}
    
    respond_to do |format|
			format.js
		end
  end

  def edit
    @name = "initial"
    if !params[:name].nil?
      @name = params[:name]
    end

		@list_sequence = Sequence.all
    @sequence = Sequence.where(:name => @name).first
    @sequence_listes = Sequence.where(:name => @name).first.sequence_liste
    @sequence_listes_no_place = Sequence.where(:name => @name).first.sequence_liste.select{ |i| i.order_sequence.nil?}
     @tab_correct_id = Sequence.where(:name => @name).first.sequence_liste.order("order_sequence").select{ |i| !i.order_sequence.nil?}.map{|i| i.id}
	end

  def display_sequence_edit
    @sequence = Sequence.where(:name => params[:sequence_name]).first
    @sequence_listes = @sequence.sequence_liste.order("order_sequence").select{ |i| !i.order_sequence.nil?}
    @sequence_listes_no_place = @sequence.sequence_liste.select{ |i| i.order_sequence.nil?}
  
     @tab_correct_id = @sequence.sequence_liste.order("order_sequence").select{ |i| !i.order_sequence.nil?}.map{|i| i.id}

    respond_to do |format|
			format.js
		end
  end

  def save
    #@sequence = Sequence.find(params[:sequence_id])
    order_sequence_tab = params[:order_sequence].scan(/\d+/)
    for sequence_id in order_sequence_tab
      @sequence_liste = SequenceListe.find(sequence_id.to_i)
      @sequence_liste.order_sequence = order_sequence_tab.index(sequence_id)
      @sequence_liste.save  
    end

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

  def new 
  end

  def create
    Rails.logger = Logger.new(STDOUT)
    sequence = Sequence.new
    sequence.name = params[:sequence][:name]
    
    files_fields = params['sequence']['file']
    for file in files_fields do
      image = Image.new
      image.image_file = file
      sequence_liste = SequenceListe.new
      sequence_liste.image = image
      sequence.sequence_liste << sequence_liste
    end
    
    sequence.save

    redirect_to :action => 'edit', :name => sequence.name
  end
end
