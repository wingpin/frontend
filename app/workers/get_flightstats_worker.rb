require 'iron_worker'

class GetFlightstatsWorker < IronWorker::Base
  
  attr_accessor :guid
  attr_accessor :airline_code
  attr_accessor :flight_number
  attr_accessor :depart_date_min
  attr_accessor :depart_date_max
  
  def run
    
  end
  
end
