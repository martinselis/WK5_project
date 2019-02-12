require_relative('../db/sql_helper')
require_relative('./city')
require_relative('./sight')

class Visit

  attr_reader :id
  attr_accessor :city_id, :visited

  def initialize(details)
    @id = details["id"].to_i if details["id"]
    @city_id = details["city_id"]
    @visited = details["visited"]
  end

  def city
    sql = "SELECT city.* FROM visit
    INNER JOIN city
    ON visit.city_id = city.id
    WHERE visit.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values).first()
    return City.new(result)
  end

  def save
    sql = "INSERT INTO visit(city_id, visited) VALUES($1, $2)

    returning id"
    values = [@city_id, @visited]
    result = SqlRunner.run(sql, values)
    @id = result.first()["id"].to_i
  end

  def update
    sql = "UPDATE visit SET (city_id, visited) = ($1, $2)
    WHERE ID = $3"
    values = [@city_id, @visited, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM visit WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM visit WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql,values).first()
    return Visit.new(result)
  end

  def self.find_all
    sql = "SELECT * FROM visit
    ORDER BY id ASC"
    results = SqlRunner.run(sql)
    return results.map { |visit| Visit.new(visit)}
  end

  def self.delete_all
    sql = "DELETE FROM visit"
    SqlRunner.run(sql)
  end

  def visit_status
    @visited == "t" ? "Visited" : "Not visited"
  end

  def self.find_visited()
    sql = "SELECT * FROM visit WHERE visited is True"
    result = SqlRunner.run(sql)
    return result.map {|visit| Visit.new(visit)}
  end

  def self.find_not_visited()
    sql = "SELECT * FROM visit WHERE visited is False"
    result = SqlRunner.run(sql)
    return result.map {|visit| Visit.new(visit)}
  end

  def update_status
    @visited == "t" ? @visited = "f" : @visited = "t"
    update()
  end

  def self.visited_by_country(country)
    all_bucket_list_items = Visit.find_visited()
    filtered_bucket_list = []
    all_bucket_list_items.each { |item|
      if item.city.country.id == country.id
        filtered_bucket_list << item
      end
    }
    return filtered_bucket_list
  end

  def self.not_visited_by_country(country)
    all_bucket_list_items = Visit.find_not_visited()
    filtered_bucket_list = []
    all_bucket_list_items.each { |item|
      if item.city.country.id == country.id
        filtered_bucket_list << item
      end
    }
    return filtered_bucket_list
  end

  def self.search(value)
    value = value.downcase
    bucketlist = Visit.find_all
    matching_search = []
    bucketlist.each { |item|
      if (item.city.name.downcase == value || item.city.country.name.downcase == value)
        matching_search << item
      end
    }
    return matching_search
  end

  def sights
    sights = Sight.find_all_by_city(@id)
  end

  def add_sight(details)
    sight = Sight.new(details)
    sight.save
  end

end
