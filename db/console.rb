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

prestige_records = Label.new({'name' => 'Prestige Records',
                              'contact' => 'prestigerecords@email.com'})
prestige_records.save()

reprise_records = Label.new({'name' => 'Reprise Records',
                             'contact' => 'repriserecords@email.com'})
reprise_records.save()

polydor_records = Label.new({'name' => 'Polydor Reocords',
                             'contact' => 'polydorrecords@email.com'})
polydor_records.save()

mac_demarco = Artist.new({'name' => 'Mac DeMarco',
                          'label_id' => captured_tracks.id})
mac_demarco.save()

the_beach_boys = Artist.new({'name' => 'The Beach Boys',
                             'label_id' => capitol_records.id})
the_beach_boys.save()

miles_davis = Artist.new({'name' => 'Miles Davis',
                          'label_id' => prestige_records.id})
miles_davis.save()

neil_young = Artist.new({'name' => 'Neil Young',
                         'label_id' => reprise_records.id})
neil_young.save()

lana_del_rey = Artist.new({'name' => 'Lana Del Rey',
                           'label_id' => polydor_records.id})
lana_del_rey.save()

this_old_dog = Record.new({'record_name' => 'This Old Dog',
                           'artist_id' => mac_demarco.id,
                           'genre' => 'Rock',
                           'stock' => 15,
                           'buying_cost' => 5,
                           'selling_price' => 15})
this_old_dog.save()

here_comes_the_cowboy = Record.new({'record_name' => 'Here Comes The Cowboy',
                           'artist_id' => mac_demarco.id,
                           'genre' => 'Rock',
                           'stock' => 20,
                           'buying_cost' => 5,
                           'selling_price' => 15})
here_comes_the_cowboy.save()

pet_sounds = Record.new({'record_name' => 'Pet Sounds',
                         'artist_id' => the_beach_boys.id,
                         'genre' => 'Rock',
                         'stock' => 1,
                         'buying_cost' => 5,
                         'selling_price' => 15})
pet_sounds.save()

relaxin_with_the_miles_davis_quintet = Record.new({'record_name' => "Relaxin' with the Miles Davis Quintet",
                                                   'artist_id' => miles_davis.id,
                                                   'genre' => 'Jazz',
                                                   'stock' => 5,
                                                   'buying_cost' => 4,
                                                   'selling_price' => 13})
relaxin_with_the_miles_davis_quintet.save()

harvest = Record.new({'record_name' => 'Harvest',
                      'artist_id' => neil_young.id,
                      'genre' => 'Country',
                      'stock' => 0,
                      'buying_cost' => 10,
                      'selling_price' => 20})
harvest.save()

born_to_die = Record.new({'record_name' => 'Born To Die',
                          'artist_id' => lana_del_rey.id,
                          'genre' => 'Pop',
                          'stock' => 10,
                          'buying_cost' => 8,
                          'selling_price' => 15})
born_to_die.save()

binding.pry
nil
