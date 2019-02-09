require ('minitest/autorun')
require ('minitest/rg')
require_relative ('../models/visit')

class VisitTest < MiniTest::Test

  def setup
    @visit = Visit.new({"city_id" => 2, "visited" => "true"})
  end

  def test_class
    assert_equal(Visit, @visit.class)
  end

  def test_name
    assert_equal("true", @visit.visited)
  end

end
