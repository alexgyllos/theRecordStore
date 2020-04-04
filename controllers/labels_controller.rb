require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/label.rb' )
also_reload( '../models/*' )

# INDEX

get '/labels' do
  @labels = Label.all()
  erb (:"labels/index")
end

# EDIT

get '/labels/:id/edit' do
  id = params['id'].to_i
  @label = Label.find(id)
  erb(:"labels/edit")
end

# SHOW

get '/labels/:id' do
  @label = Label.find(params['id'].to_i)
  erb(:"labels/show")
end

# DELETE

post '/labels/:id/delete' do
  id = params['id'].to_i
  label = Label.find(id)
  label.delete()
  redirect('/')
end

# POST EDIT

post '/labels/:id' do
  updated_label = Label.new(params)
  updated_label.update()
  redirect('/labels/' + params['id'])
end
