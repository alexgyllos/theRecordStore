require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/record.rb')
also_reload('../models/*')

get '/genres' do
  @records = Record.all()
  erb( :"genres/index" )
end
