class Images < ActiveRecord::Base
  has_many :sequence_liste
  has_many :sequence, :through => :sequence_liste
end
