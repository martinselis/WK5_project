require ('sinatra')
require ('sinatra/contrib/all') if development?
also_reload ('./models/*')
require_relative('../models/city')
require_relative('../models/country')
require_relative('../models/visit')

get '/countries' do
  @countries = Country.find_all
  erb (:"countries/index")
end

get '/countries/new' do
  erb (:"countries/new")
end

get '/countries/:id' do
  @country = Country.find(params[:id])
  @cities = @country.cities
  erb (:"countries/details")
end

post '/countries' do
  @country = Country.new(params)
  @country.save
  redirect "/countries"
end

get '/countries/:id/edit' do
  @country = Country.find(params[:id])
  erb(:"countries/edit")
end

post '/countries/:id' do
  @country = Country.find(params[:id])
  @country.name = params["name"]
  @country.update
  redirect "/countries"
end

post '/countries/:id/delete' do
  @country = Country.find(params[:id])
  @country.delete
  redirect "/"
end








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
