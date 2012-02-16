class ImageController < ApplicationController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
   @image = Image.new(params[:image])
   if @image.save
     redirect_to :action => 'index'
   else
     render :action => 'new'
   end
  end

end
