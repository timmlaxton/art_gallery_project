require_relative('../models/artist')
require_relative('../models/exhibition')



exhibition1 = Exhibition.new({'name' => "Electric Soup Anniversary", 'opening' => "2019-06-02", "closing" => "2019-10-12", "entry_fee" => 6})
exhibition1.save()

exhibition2 = Exhibition.new({'name' => "Hard Boiled Retrospective", 'opening' => "2019-02-06", "closing" => "2019-05-14", "entry_fee" => 10})
exhibition2.save()

exhibition3 = Exhibition.new({'name' => "AKIRA", 'opening' => "2020-02-20", "closing" => "2020-06-12", "entry_fee" => 12})
exhibition3.save()

exhibition4 = Exhibition.new({'name' => "Colours in comics", 'opening' => "2020-07-20", "closing" => "2020-10-12", "entry_fee" => 12})
exhibition3.save()



artist1 = Artist.new({'name' => "Frank Quietly"})
artist1.save

artist2 = Artist.new({'name' => "Geoff Darrow"})
artist2.save

artist3 = Artist.new({'name' => "Katsuhiro Otomo"})
artist3.save

artist4 = Artist.new({'name' => "Jordie Bellaire"})
artist4.save
