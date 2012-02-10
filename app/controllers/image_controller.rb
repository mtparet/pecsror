class ImageController < ApplicationController

  def new
    @Image = Image.new
  end

end
