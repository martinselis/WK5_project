require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/visit.rb')


require ('pry')

country1 = Country.new({"name" => "Latvia"})
country1.save
country2 = Country.new({"name" => "Lithuania"})
country2.save

city1 = City.new({"name" => "Riga", "country_id" => country1.id})
city1.save

visit1 = Visit.new({"city_id" => city1.id, "visited" => "T" })
visit1.save
binding.pry
nil
