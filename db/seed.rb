require_relative('../models/country.rb')
require_relative('../models/city.rb')
require_relative('../models/visit.rb')
require ('pry')

Country.delete_all
country1 = Country.new({"name" => "Spain"})
country2 = Country.new({"name" => "Italy"})
country3 = Country.new({"name" => "Indonesia"})
country4 = Country.new({"name" => "Greece"})
country1.save
country2.save
country3.save
country4.save

city1 = City.new({"name" => "Barcelona", "country_id" => country1.id})
city2 = City.new({"name" => "Rome", "country_id" => country2.id})
city3 = City.new({"name" => "Bali", "country_id" => country3.id})
city4 = City.new({"name" => "Obut", "country_id" => country3.id})

city1.save
city2.save
city3.save
city4.save

visit1 = Visit.new({"city_id" => city1.id, "visited" => "true" })
visit1.save
binding.pry
nil
