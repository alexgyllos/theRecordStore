require('sinatra')
require('sinatra/contrib/all') if development?

require_relative('./models/record')
require_relative('./models/artist')
require_relative('./models/label')
also_reload('./models/*')

get '/' do
  @records = Record.all()
  erb(:index)
end
