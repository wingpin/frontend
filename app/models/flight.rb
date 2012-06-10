class Flight

  def self.find(airline_code, flight_number, departure_date, departing_airport_code)
    history_record = $flightstats.find_flight_records(airline_code, flight_number, departing_airport_code, true, "#{departure_date}T00:00", "#{departure_date}T23:59")['FlightHistoryGetRecordsResponse']['FlightHistory']
    #return history_record
    return nil unless history_record
    return self.new(history_record)
  end
  
  %w(
    airline
    flight_number
    departure_terminal
    departure_gate
    departure_gate_estimated
    departure_date
    arrival_terminal
    arrival_gate
    arrival_date_estimated
    arrival_date
    status
  ).each do |attribute|
    attr_reader attribute
  end

  def initialize history
    @airline = history['Airline']
    @flight_number = history['FlightNumber']
    @departure_terminal = history['DepartureTerminal']
    @departure_gate = history['DepartureGate']
    @departure_gate_estimated = ActiveSupport::TimeZone[history['DepartureAirportTimeZoneOffset'].to_i].parse(history['EstimatedGateDepartureDate'])
    @departure_date = ActiveSupport::TimeZone[history['DepartureAirportTimeZoneOffset'].to_i].parse(history['DepartureDate'])
    @arrival_terminal = history['ArrivalTerminal']
    @arrival_gate = history['ArrivalGate']
    @arrival_date = ActiveSupport::TimeZone[history['ArrivalAirportTimeZoneOffset'].to_i].parse(history['ArrivalDate'])
    @arrival_date_estimated = ActiveSupport::TimeZone[history['ArrivalAirportTimeZoneOffset'].to_i].parse(history['EstimatedGateArrivalDate'])
    @status = history['Status']
  end
  
end
