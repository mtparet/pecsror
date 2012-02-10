class Sequence < ActiveRecord::Base
  has_many :sequence_liste
  has_many :image, :through => :sequence_liste
end
