class Airport
  
  @@airports = nil
  
  def self.all
    return @@airports if @@airports
    
    airports = $redis.get('airport-list')
    unless airports
      airports = $flightstats.get_all_airports['AirportGetAllAirportsResponse']['Airport'].to_json
      $redis.set('airport-list', airports)
      $redis.expire('airport-list', 7.days.seconds.to_i)
    end
    
    @@airports = JSON.parse(airports)
  end
  
  def self.select_list
    self.all.map do |a|
      a = { :airport_code => a['AirportCode'], :friendly_name => "#{a['AirportCode']} (#{a['Name']})" }
    end
  end
end
