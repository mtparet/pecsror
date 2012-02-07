class Sequence < ActiveRecord::Base
  has_many :sequence_liste
  has_many :images, :through => :sequence_liste
end
