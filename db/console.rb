require('pry-byebug')
require_relative('../models/albums')
require_relative('../models/artists')

artist1 = Artist.new({ 'name' => 'Little Dragon'})
artist1.save

artist2 = Artist.new({ 'name' => 'Banks'})
artist2.save

album1 = Album.new({ 
  'title' => 'Ritual Union',
  'genre' => 'Electronic',
  'artist_id' => artist1.id
  })

album1.save

album2 = Album.new({
  'title' => 'Nabuma Rubberband',
  'genre' => 'Electronic',
  'artist_id' => artist1.id
  })

album2.save

album3 = Album.new({
  'title' => 'Goddess',
  'genre' => 'Trip hop',
  'artist_id' => artist2.id
  })

album3.save

album4 = Album.new({
  'title' => 'The Altar',
  'genre' => 'Alternative R&B',
  'artist_id' => artist2.id
  })

album4.save
binding.pry
nil