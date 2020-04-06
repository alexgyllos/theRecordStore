require_relative('../models/artist')
require_relative('../models/record')
require_relative('../models/label')
require('pry')

Record.delete_all()
Artist.delete_all()
Label.delete_all()

captured_tracks = Label.new({'name' => 'Captured Tracks',
                             'contact' => 'capturedtracks@email.com',
                             'active' => true})
captured_tracks.save()

capitol_records = Label.new({'name' => 'Capitol Records',
                             'contact' => 'capitolrecords@email.com',
                             'active' => true})
capitol_records.save()

prestige_records = Label.new({'name' => 'Prestige Records',
                              'contact' => 'prestigerecords@email.com',
                              'active' => true})
prestige_records.save()

reprise_records = Label.new({'name' => 'Reprise Records',
                             'contact' => 'repriserecords@email.com',
                             'active' => true})
reprise_records.save()

polydor_records = Label.new({'name' => 'Polydor Reocords',
                             'contact' => 'polydorrecords@email.com',
                             'active' => true})
polydor_records.save()

columbia_records = Label.new({'name' => 'Columbia Reocords',
                             'contact' => 'columbiarecords@email.com',
                             'active' => true})
columbia_records.save()

the_beatles = Artist.new({'name' => 'The Beatles',
                          'label_id' => capitol_records.id,
                          'active' => true})
the_beatles.save()

johnny_cash = Artist.new({'name' => 'Johnny Cash',
                          'label_id' => columbia_records.id,
                          'active' => true})
johnny_cash.save()

mac_demarco = Artist.new({'name' => 'Mac DeMarco',
                          'label_id' => captured_tracks.id,
                          'active' => true})
mac_demarco.save()

the_beach_boys = Artist.new({'name' => 'The Beach Boys',
                             'label_id' => capitol_records.id,
                             'active' => true})
the_beach_boys.save()

miles_davis = Artist.new({'name' => 'Miles Davis',
                          'label_id' => prestige_records.id,
                          'active' => true})
miles_davis.save()

neil_young = Artist.new({'name' => 'Neil Young',
                         'label_id' => reprise_records.id,
                         'active' => true})
neil_young.save()

lana_del_rey = Artist.new({'name' => 'Lana Del Rey',
                           'label_id' => polydor_records.id,
                           'active' => true})
lana_del_rey.save()

this_old_dog = Record.new({'record_name' => 'This Old Dog',
                           'artist_id' => mac_demarco.id,
                           'genre' => 'Rock',
                           'stock' => 15,
                           'buying_cost' => 5,
                           'selling_price' => 15})
this_old_dog.save()

at_san_quentin = Record.new({'record_name' => 'At San Quentin',
                           'artist_id' => johnny_cash.id,
                           'genre' => 'Country',
                           'stock' => 15,
                           'buying_cost' => 5,
                           'selling_price' => 15})
at_san_quentin.save()

here_comes_the_cowboy = Record.new({'record_name' => 'Here Comes The Cowboy',
                           'artist_id' => mac_demarco.id,
                           'genre' => 'Rock',
                           'stock' => 20,
                           'buying_cost' => 5,
                           'selling_price' => 15})
here_comes_the_cowboy.save()

another_one = Record.new({'record_name' => 'Another One',
                         'artist_id' => mac_demarco.id,
                         'genre' => 'Rock',
                         'stock' => 2,
                         'buying_cost' => 5,
                         'selling_price' => 17})
another_one.save()

revolver = Record.new({'record_name' => 'Revolver',
                         'artist_id' => the_beatles.id,
                         'genre' => 'Rock',
                         'stock' => 2,
                         'buying_cost' => 5,
                         'selling_price' => 17})
revolver.save()

rubber_soul = Record.new({'record_name' => 'Rubber Soul',
                         'artist_id' => the_beatles.id,
                         'genre' => 'Rock',
                         'stock' => 2,
                         'buying_cost' => 5,
                         'selling_price' => 17})
rubber_soul.save()

salad_days = Record.new({'record_name' => 'Salad Days',
                         'artist_id' => mac_demarco.id,
                         'genre' => 'Rock',
                         'stock' => 0,
                         'buying_cost' => 4,
                         'selling_price' => 13})
salad_days.save()

pet_sounds = Record.new({'record_name' => 'Pet Sounds',
                         'artist_id' => the_beach_boys.id,
                         'genre' => 'Rock',
                         'stock' => 1,
                         'buying_cost' => 5,
                         'selling_price' => 15})
pet_sounds.save()

smile = Record.new({'record_name' => 'Smile',
                          'artist_id' => the_beach_boys.id,
                          'genre' => 'rock',
                          'stock' => 13,
                          'buying_cost' => 8,
                          'selling_price' => 18})
smile.save()

surfer_girl = Record.new({'record_name' => 'Surfer Girl',
                          'artist_id' => the_beach_boys.id,
                          'genre' => 'rock',
                          'stock' => 13,
                          'buying_cost' => 8,
                          'selling_price' => 18})
surfer_girl.save()

surfin_usa = Record.new({'record_name' => "Surfin' USA",
                          'artist_id' => the_beach_boys.id,
                          'genre' => 'rock',
                          'stock' => 13,
                          'buying_cost' => 8,
                          'selling_price' => 18})
surfin_usa.save()

kind_of_blue = Record.new({'record_name' => "Kind of Blue",
                                                   'artist_id' => miles_davis.id,
                                                   'genre' => 'Jazz',
                                                   'stock' => 5,
                                                   'buying_cost' => 4,
                                                   'selling_price' => 13})
kind_of_blue.save()

miles_ahead = Record.new({'record_name' => "Miles Ahead",
                                                   'artist_id' => miles_davis.id,
                                                   'genre' => 'Jazz',
                                                   'stock' => 5,
                                                   'buying_cost' => 4,
                                                   'selling_price' => 13})
miles_ahead.save()

milestones = Record.new({'record_name' => "Milestones",
                                                   'artist_id' => miles_davis.id,
                                                   'genre' => 'Jazz',
                                                   'stock' => 5,
                                                   'buying_cost' => 4,
                                                   'selling_price' => 13})
milestones.save()

harvest = Record.new({'record_name' => 'Harvest',
                      'artist_id' => neil_young.id,
                      'genre' => 'Country',
                      'stock' => 0,
                      'buying_cost' => 10,
                      'selling_price' => 20})
harvest.save()

harvest_moon = Record.new({'record_name' => 'Harvest Moon',
                      'artist_id' => neil_young.id,
                      'genre' => 'Country',
                      'stock' => 0,
                      'buying_cost' => 10,
                      'selling_price' => 20})
harvest_moon.save()

born_to_die = Record.new({'record_name' => 'Born To Die',
                          'artist_id' => lana_del_rey.id,
                          'genre' => 'Pop',
                          'stock' => 10,
                          'buying_cost' => 8,
                          'selling_price' => 15})
born_to_die.save()

lust_for_life = Record.new({'record_name' => 'Lust for Life',
                          'artist_id' => lana_del_rey.id,
                          'genre' => 'Pop',
                          'stock' => 10,
                          'buying_cost' => 8,
                          'selling_price' => 15})
lust_for_life.save()

binding.pry
nil
