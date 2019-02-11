require_relative('../db/sql_helper')
require_relative('./visit')

class Sight

  attr_reader :id
  attr_accessor :name, :visit_id

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @name = details["name"]
    @visit_id = details["visit_id"]
  end

  def save
    sql = "INSERT INTO sight(name, visit_id) VALUES($1, $2)

    returning id"
    values = [@name, @visit_id]
    result = SqlRunner.run(sql, values)
    @id = result.first()["id"].to_i
  end

end
