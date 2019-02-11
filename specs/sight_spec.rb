require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/sight')

class SightTest < MiniTest::Test

  def setup
    @sight = Sight.new({"name" => "Eiffel Tower", "visit_id" => 1})
  end

  def test_class
    assert_equal(Sight, @sight.class)
  end

  def test_name
    assert_equal("Eiffel Tower", @sight.name)
  end

  def test_visit_id
    assert_equal(1, @sight.visit_id)
  end

end
