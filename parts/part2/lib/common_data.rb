module CommonData
  STATES = {
    # source https://gist.github.com/dblandin/2991970
    "AK"=>"Alaska",
    "AL"=>"Alabama",
    "AR"=>"Arkansas",
    "AS"=>"American Samoa",
    "AZ"=>"Arizona",   
    "CA"=>"California",
    "CO"=>"Colorado",
    "CT"=>"Connecticut",
    "DC"=>"District of Columbia",
    "DE"=>"Delaware",
    "FL"=>"Florida",
    "GA"=>"Georgia",
    "GU"=>"Guam",
    "HI"=>"Hawaii",
    "IA"=>"Iowa",
    "ID"=>"Idaho",
    "IL"=>"Illinois",
    "IN"=>"Indiana",
    "KS"=>"Kansas",
    "KY"=>"Kentucky",
    "LA"=>"Louisiana",
    "MA"=>"Massachusetts",
    "MD"=>"Maryland",
    "ME"=>"Maine",
    "MI"=>"Michigan",
    "MN"=>"Minnesota",
    "MO"=>"Missouri",
    "MS"=>"Mississippi",
    "MT"=>"Montana",
    "NC"=>"North Carolina",
    "ND"=>"North Dakota",
    "NE"=>"Nebraska",
    "NH"=>"New Hampshire",
    "NJ"=>"New Jersey",
    "NM"=>"New Mexico",
    "NV"=>"Nevada",
    "NY"=>"New York",
    "OH"=>"Ohio",
    "OK"=>"Oklahoma",
    "OR"=>"Oregon",
    "PA"=>"Pennsylvania",
    "PR"=>"Puerto Rico",
    "RI"=>"Rhode Island",
    "SC"=>"South Carolina",
    "SD"=>"South Dakota",
    "TN"=>"Tennessee",
    "TX"=>"Texas",
    "UT"=>"Utah",
    "VA"=>"Virginia",
    "VI"=>"Virgin Islands",
    "VT"=>"Vermont",
    "WA"=>"Washington",
    "WI"=>"Wisconsin",
    "WV"=>"West Virginia",
    "WY"=>"Wyoming"
  }

  # California => CA
  def get_state_abbrevation(full_state_name)
    STATES.select{|k,v| v == full_state_name}.keys[0]
  end

  # Check if they are the same state
  # state_of_address, state_from_cli are normalized 
  # as State name or abbrevation
  def same_state?(state_of_address, state_from_cli)
    len_state_of_address = state_of_address.length
    len_state_from_cli = state_from_cli.length

    if len_state_of_address == 2 
        if len_state_from_cli ==2  # both are abbrevation
            return state_of_address == state_from_cli
        else
            state_of_address = STATES[state_of_address] 
            return state_of_address == state_from_cli   
        end
    else
        if len_state_from_cli ==2 
            state_from_cli = STATES[state_from_cli]
            return state_of_address == state_from_cli
        else # both are full name
            return state_of_address == state_from_cli   
        end
    end            
  end

  def in_state?(address, state_from_cli)
    # all states if state_from_cli undefined or empty
    return true if state_from_cli.nil? || state_from_cli.empty? 
    
    state_of_address = address.split(',').last
    # No valid state information from address    
    return false if state_of_address.nil? || state_of_address.empty?

    same_state?(state_of_address.strip, state_from_cli)

  end
  def get_state(address) 
    state = address.split(/[,;]/).last
    return 'NA' if state.nil? || state.empty? 
    state.strip.upcase
  end
end