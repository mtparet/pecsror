class SequenceListe < ActiveRecord::Base
  belongs_to :sequence
  belongs_to :images
end
