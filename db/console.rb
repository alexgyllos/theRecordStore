require_relative('../models/artist')
require_relative('../models/record')
require_relative('../models/label')
require('pry')

Record.delete_all()
Artist.delete_all()
Label.delete_all()

captured_tracks = Label.new({'name' => 'Captured Tracks',
                             'contact' => 'capturedtracks@email.com'})
captured_tracks.save()

capitol_records = Label.new({'name' => 'Capitol Records',
                             'contact' => 'capitolrecords@email.com'})
capitol_records.save()

mac_demarco = Artist.new({'name' => 'Mac DeMarco',
                          'label_id' => captured_tracks.id})
mac_demarco.save()

the_beach_boys = Artist.new({'name' => 'The Beach Boys',
                             'label_id' => capitol_records.id})
the_beach_boys.save()

this_old_dog = Record.new({'name' => 'This Old Dog',
                           'artist_id' => mac_demarco.id,
                           'genre' => 'Rock',
                           'stock' => 15,
                           'buying_cost' => 5,
                           'selling_price' => 15})
this_old_dog.save()

here_comes_the_cowboy = Record.new({'name' => 'Here Comes The Cowboy',
                           'artist_id' => mac_demarco.id,
                           'genre' => 'Rock',
                           'stock' => 20,
                           'buying_cost' => 5,
                           'selling_price' => 15})
here_comes_the_cowboy.save()

pet_sounds = Record.new({'name' => 'Pet Sounds',
                         'artist_id' => the_beach_boys.id,
                         'genre' => 'Rock',
                         'stock' => 10,
                         'buying_cost' => 5,
                         'selling_price' => 15})
pet_sounds.save()


binding.pry
nil
