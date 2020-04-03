require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/label.rb' )
also_reload( '../models/*' )

get '/labels' do
  @labels = Label.all()
  erb (:"labels/index")
end

get '/labels/:id' do
  @label = Label.find(params['id'].to_i)
  erb(:"labels/show")
end
