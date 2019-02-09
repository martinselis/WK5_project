require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/country')

class CountryTest < MiniTest::Test

  def setup
    @country = Country.new({"name" => "Spain"})
  end

  def test_class
    assert_equal(Country, @country.class)
  end

  def test_name
    assert_equal("Spain", @country.name)
  end

end
