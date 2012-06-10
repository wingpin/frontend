class Airline
  
  @@airlines = nil
  
  def self.all
    return @@airlines if @@airlines
    
    airlines = $redis.get('airline-list')
    unless airlines
      airlines = $flightstats.get_all_airlines['AirlineGetAllAirlinesResponse']['Airline'].to_json
      $redis.set('airline-list', airlines)
      $redis.expire('airline-list', 7.days.seconds.to_i)
    end
    
    @@airlines = JSON.parse(airlines)
  end
  
  def self.select_list
    self.all.map do |a|
      a = { :airline_code => a['AirlineCode'], :friendly_name => "#{a['AirlineCode']} (#{a['Name']})" }
      def a.airline_code
        self[:airline_code]
      end
      def a.friendly_name
        self[:friendly_name]
      end
      a
    end
  end
  
end
