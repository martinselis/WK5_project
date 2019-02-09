require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/city')

class CityTest < MiniTest::Test

  def setup
    @city = City.new({"name" => "Madrid", "country_id" => 1})
  end

  def test_class
    assert_equal(City, @city.class)
  end

  def test_name
    assert_equal("Madrid", @city.name)
  end

  def test_country_id
    assert_equal(1, @city.country_id)
  end

end
