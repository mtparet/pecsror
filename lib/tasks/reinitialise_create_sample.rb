SequenceListe.delete_all
Sequence.delete_all
Image.delete_all

['initial','maison','fleur','lit','garcon','smiley_good','smiley_bad'].each do |valeur|
  i = Image.new(:name => valeur)
  i.image_file = File.open("app/assets/images/base/#{valeur}.jpg")
  i.save
end

sq = SequenceListe.new(:order_sequence => 1)
sq.image = Image.where(:name => "initial").first

s = Sequence.new(:name => 'initial')
s.sequence_liste << sq
s.save

s = Sequence.new(:name => 'maison')

sq = SequenceListe.new(:order_sequence => 1)
sq.image = Image.where(:name => "maison").first
s.sequence_liste << sq

sq = SequenceListe.new(:order_sequence => 2)
sq.image = Image.where(:name => "fleur").first
s.sequence_liste << sq

sq = SequenceListe.new(:order_sequence => 3)
sq.image = Image.where(:name => "garcon").first
s.sequence_liste << sq

s.save
