require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/artist.rb')
also_reload('../models/*')

# INDEX

get '/artists' do
  @artists = Artist.all()
  erb( :"artists/index" )
end

# EDIT

get '/artists/:id/edit' do
  id = params['id'].to_i
  @artist = Artist.find(id)
  erb(:"artists/edit")
end

# SHOW

get '/artists/:id' do
  @artist = Artist.find(params['id'].to_i)
  erb( :"artists/show")
end

post '/artists/:id/delete' do
  id = params['id'].to_i
  artist = Artist.find(id)
  artist.delete()
  redirect('/')
end

post '/artists/:id' do
  updated_artist = Artist.new(params)
  updated_artist.update()
  redirect('/artists/' + params['id'])
end
