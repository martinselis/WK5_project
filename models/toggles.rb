class Toggles

  def self.filterToggles(activeToggle)
    
    toggles = { "visited" => "toggle",
      "not_visited" => "toggle",
      "all" => "toggle"
    }
    toggles[activeToggle] += " activeToggle"
    return toggles

  end

  def self.countryToggles(countries, active = "none")

  toggles = {}
  countries.each { |country|
    country.name == active ? toggles[country.name] = "countryName countryNameActive" :
    toggles[country.name] = "countryName"
  }
  return toggles

  end

end

# {
#   "visited" => "toggle",
#   "not_visited" => "toggle",
#   "all" => "toggle activeToggle"}
