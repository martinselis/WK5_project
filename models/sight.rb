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

  def update
    sql = "UPDATE sight SET (name, visit_id) = ($1, $2)

    WHERE id = $3"
    values = [@name, @visit_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM sight WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM sight WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first()
    return Sight.new(result)
  end

  def self.find_all_by_city(id)
    sql = "SELECT sight.* FROM sight
    INNER JOIN visit
    on visit.id = sight.visit_id
    where visit.id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return result.map {|sight| Sight.new(sight)
    }
  end

end
