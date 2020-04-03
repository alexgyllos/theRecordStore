require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('controllers/records_controller')
require_relative('controllers/artists_controller')
require_relative('controllers/labels_controller')
require_relative('controllers/genres_controller')

get '/' do
  @records = Record.all()
  erb(:index)
end

get '/records/:id' do
  @records = Record.find(params['id'].to_i)
  @artist = Artist.all()
  erb( :"records/show" )
end
