class SequenceListe < ActiveRecord::Base
  belongs_to :sequence
  belongs_to :image
end
