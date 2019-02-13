class Toggles

  def self.toggleClasses(activeToggle)
    toggles = { "visited" => "toggle",
      "not_visited" => "toggle",
      "all" => "toggle"
    }
    toggles[activeToggle] += " activeToggle"
    return toggles
  end


end

# {
#   "visited" => "toggle",
#   "not_visited" => "toggle",
#   "all" => "toggle activeToggle"}
