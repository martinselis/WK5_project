require ('sinatra')
require ('sinatra/contrib/all') if development?
also_reload ('./models/*')
require_relative('./models/city')
require_relative('./models/country')
require_relative('./models/visit')
require_relative('controllers/country')
require_relative('controllers/city')
require_relative('controllers/visit')
require ('pry')



get '/' do
  @bucketlist = Visit.find_all
  @countries = Country.find_all
  erb(:index)
end

get '/visited' do
  @bucketlist = Visit.find_visited
  @countries = Country.find_all
  erb(:index)
end

get '/not-visited' do
  @bucketlist = Visit.find_not_visited
  @countries = Country.find_all
  erb(:index)
end

post '/search' do
  @countries = Country.find_all
  @bucketlist = Visit.search(params[:search])
  erb(:index)
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
