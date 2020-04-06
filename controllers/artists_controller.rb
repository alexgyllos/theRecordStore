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
  @labels = Label.all()
  erb(:"artists/edit")
end

# NEW

get '/artists/new' do
  @artists = Artist.all()
  @labels = Label.all()
  erb(:"artists/new")
end

# SHOW

get '/artists/:id' do
  @artist = Artist.find(params['id'].to_i)
  erb( :"artists/show")
end

# CREATE

post '/artists' do
  new_artist = Artist.new(params)
  new_artist.save()
  redirect('/artists')
end

# DELETE

post '/artists/:id/delete' do
  id = params['id'].to_i
  artist = Artist.find(id)
  artist.delete()
  redirect('/')
end

# POST EDIT

post '/artists/:id' do
  updated_artist = Artist.new(params)
  updated_artist.update()
  redirect('/artists/' + params['id'])
end
