require ('sinatra')
require ('sinatra/contrib/all') if development?
also_reload ('./models/*')
require_relative('../models/city')
require_relative('../models/country')
require_relative('../models/visit')
require ('pry')

get '/cities' do
  @cities = City.find_all
  erb (:"cities/index")
end

get '/cities/new' do
  @countries = Country.find_all
  erb (:"cities/new")
end

post '/cities' do
  @city = City.new(params)
  @city.save
  @visit = Visit.new({"city_id" => @city.id, "visited"=> params[:visited] })
  @visit.save
  redirect "/"
end

get '/cities/:id/edit' do
  @city = City.find(params[:id])
  erb (:"cities/edit")
end

post '/cities/:id' do
  @city = City.find(params[:id])
  @city.name = params["name"]
  @city.update
  redirect "/"
end

post '/cities/:id/delete' do
  @city = City.find(params[:id])
  @city.delete
  redirect "/"
end

get '/cities/by-country/:id' do
  @bucketlist = Country.visits_by_country(params[:id])
  @countries = Country.find_all
  if @bucketlist.length == 0
    @error = 1
    erb(:"cities/new")
  else
    error = 0
    erb(:"cities/by-country")
  end
end

get '/cities/by-country/:id/visited' do
  @country = Country.find(params[:id])
  @countries = Country.find_all

  @bucketlist = Visit.visited_by_country(@country)

  erb(:"cities/by-country")
end

get '/cities/by-country/:id/not-visited' do
  @country = Country.find(params[:id])
  @countries = Country.find_all
  @bucketlist = Visit.not_visited_by_country(@country)
  erb(:"cities/by-country")
end


#
# post '/countries' do
#   @country = Country.new(params)
#   @country.save
#   redirect "/countries"
# end
#
# get '/countries/:id/edit' do
#   @country = Country.find(params[:id])
#   erb(:"countries/edit")
# end
#
# post '/countries/:id' do
#   @country = Country.find(params[:id])
#   @country.name = params["name"]
#   @country.update
#   redirect "/countries"
# end
#



# *Naming convention for REST*
# |VERB  |PATH                    |ACTION |
# |:——:|:———————————:|:——:|
# |GET   |/app                     | index |
# |GET   |/app/:id                  | show |
# |GET   |/app/new                  | new  |
# |POST |/app                     | create |
# |GET   |/app/:id/edit          |  edit   |
# |POST |/app/:id                 | update |
# |POST |/app/:id/delete          | destroy|
