require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('controllers/records_controller')
require_relative('controllers/artists_controller')
require_relative('controllers/labels_controller')
require_relative('controllers/genres_controller')

# INDEX

get '/' do
  @records = Record.all()
  erb(:index)
end

# NEW

get '/records/new' do
  @records = Record.all
  erb(:"records/new")
end

# EDIT

get '/records/:id/edit' do
  id = params['id'].to_i
  @record = Record.find(id)
  erb(:"records/edit")
end

# SHOW

get '/records/:id' do
  @records = Record.find(params['id'].to_i)
  @artist = Artist.all()
  erb( :"records/show" )
end

# DELETE

post '/records/:id/delete' do
  id = params['id'].to_i()
  record = Record.find(id)
  record.delete()
  redirect('/')
end

# POST EDIT
post '/records/:id' do
  updated_record = Record.new(params)
  updated_record.update()
  redirect('/records/' + params['id'])
end
