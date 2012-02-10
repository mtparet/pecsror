SequenceListe.delete_all
Sequence.delete_all
Images.delete_all

['initial','maison','fleur','lit','garcon'].each do |valeur|
  i = Images.new(:name => valeur)
  i.image_file = File.open("app/assets/images/#{valeur}.jpg")
  i.save
end

sq = SequenceListe.new(:order => 1)
sq.images = Images.where(:name => "initial").first

s = Sequence.new(:name => 'initial')
s.sequence_liste << sq
s.save

s = Sequence.new(:name => 'maison')

sq = SequenceListe.new(:order => 1)
sq.images = Images.where(:name => "maison").first
s.sequence_liste << sq

sq = SequenceListe.new(:order => 2)
sq.images = Images.where(:name => "fleur").first
s.sequence_liste << sq

sq = SequenceListe.new(:order => 3)
sq.images = Images.where(:name => "garcon").first
s.sequence_liste << sq

s.save
