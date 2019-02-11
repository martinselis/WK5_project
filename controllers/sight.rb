require ('sinatra')
require ('sinatra/contrib/all') if development?
also_reload ('./models/*')
require_relative('../models/city')
require_relative('../models/visit')
require_relative('../models/sight')

get '/sight/:id/edit' do
  @sight = Sight.find(params[:id])
  erb(:"sights/edit")
end

post '/sight/:id' do
  @sight = Sight.find(params[:id])
  @sight.name = params[:name]
  @sight.update
  redirect "/"
end

post '/sight/:id/delete' do
  @sight = Sight.find(params[:id])
  @sight.delete
  redirect "/"
end

get '/sight/:id/add-sight' do
  @visit = Visit.find(params[:id])
  erb (:"sights/add")
end

post '/sight/:id/add-sight' do
  @visit = Visit.find(params[:id])
  @visit.add_sight({"name" => params[:name], "visit_id" => @visit.id})
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
