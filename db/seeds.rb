require_relative('../models/artist')
require_relative('../models/exhibition')

require('pry')


artist1 = Artist.new({'name' => "Frank Quietly"})
artist1.save

artist2 = Artist.new({'name' => "Geoff Darrow"})
artist2.save

artist3 = Artist.new({'name' => "Katsuhiro Otomo"})
artist3.save

artist4 = Artist.new({'name' => "Jordie Bellaire"})
artist4.save

exhibition1 = Exhibition.new({'name' => "Electric Soup Anniversary", 'opening' => "02-06-2019", "closing" => "12-10-2020", "entry_fee" => 6, "artist_id" => artist1.id})
exhibition1.save()

exhibition2 = Exhibition.new({'name' => "Hard Boiled Retrospective", 'opening' => "06-02-2019", "closing" => "12-05-2020", "entry_fee" => 10, "artist_id" => artist2.id})
exhibition2.save()

exhibition3 = Exhibition.new({'name' => "AKIRA", 'opening' => "20-02-2020", "closing" => "12-06-2020", "entry_fee" => 12, "artist_id" => artist3.id})
exhibition3.save()

exhibition4 = Exhibition.new({'name' => "Colours in comics", 'opening' => "20-07-2020", "closing" => "12-10-2020", "entry_fee" => 12, "artist_id" => artist4.id})
exhibition4.save()




binding.pry
nil
