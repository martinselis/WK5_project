require ('sinatra')
require ('sinatra/contrib/all') if development?
also_reload ('./models/*')
require_relative('./models/city')
require_relative('./models/country')
require_relative('./models/visit')
require_relative('controllers/country')
require_relative('controllers/city')
require_relative('controllers/visit')
require_relative('controllers/sight')
require_relative('./models/toggles')

require ('pry')

get '/' do
  @bucketlist = Visit.find_all
  @countries = Country.find_all
  @active = Toggles.filterToggles("all")
  erb(:index)
end

get '/visited' do
  @bucketlist = Visit.find_visited
  @countries = Country.find_all
  @active = Toggles.filterToggles("visited")
  erb(:index)
end

get '/not-visited' do
  @bucketlist = Visit.find_not_visited
  @countries = Country.find_all
  @active = Toggles.filterToggles("not_visited")
  erb(:index)
end

post '/search' do
  @countries = Country.find_all
  @bucketlist = Visit.search(params[:search])
  @active = Toggles.filterToggles("not_visited")
  erb(:index)
end
