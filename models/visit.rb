require_relative('../db/sql_helper')

class Visit

  attr_reader :id
  attr_accessor :city_id, :visited

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @city_id = details["city_id"]
    @visited = details["visited"]
  end

  def save
    sql = "INSERT INTO visits(city_id, visited) VALUES($1, $2)

    returning id"
    values = [@city_id, @visited]
    result = SqlRunner.run(sql, values)
    @id = result.first()["id"].to_i
  end

  def update
    sql = "UPDATE visits SET (city_id, visited) = ($1, $2)
    WHERE ID = $3"
    values = [@city_id, @visited, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM visits WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM visits WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql,values).first()
    return Visit.new(result)
  end

  def self.delete_all
    sql = "DELETE FROM visits"
    SqlRunner.run(sql)
  end

end
