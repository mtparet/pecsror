require 'carrierwave/orm/activerecord'

class Image < ActiveRecord::Base
  has_many :sequence_liste
  has_many :sequence, :through => :sequence_liste
  mount_uploader :image_file, ImageFileUploader
end
