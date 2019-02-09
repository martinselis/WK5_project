require_relative('../db/sql_helper')

class Country

  attr_reader :id
  attr_accessor :name

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @name = details["name"]
  end

  def save
    sql = "INSERT INTO country(name) VALUES($1)

    returning id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result.first()["id"].to_i
  end

  def update
    sql = "UPDATE country SET name = $1
    WHERE ID = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM country WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM country WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql,values).first()
    return Country.new(result)
  end

  def self.delete_all
    sql = "DELETE FROM country"
    SqlRunner.run(sql)
  end


end
