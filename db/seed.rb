require_relative('../models/country.rb')
require_relative('../models/city.rb')

require ('pry')

country1 = Country.new({"name" => "Latvia"})
country1.save
country2 = Country.new({"name" => "Lithuania"})
country2.save

city1 = City.new({"name" => "Riga", "country_id" => country1.id})
city1.save

binding.pry
nil
