require ('sinatra')
require ('sinatra/contrib/all') if development?
also_reload ('./models/*')
require_relative('../models/city')
require_relative('../models/country')
require_relative('../models/visit')

get '/visit/:id/update-status' do
  @visit = Visit.find(params[:id])
  @visit.update_status
  redirect "/"
end
