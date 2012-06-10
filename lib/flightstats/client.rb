require 'uri'
require 'httparty'

module Flightstats
  class Client
    include HTTParty
    
    base_uri 'https://www.pathfinder-xml.com/development/xml'
    
    def initialize(service_guid)
      @guid = service_guid
    end
    
    def find_flight_records airline_code, flight_number, departing_airport_code, search_codeshares, date_departed_min, date_departed_max
      request({
        :service => 'FlightHistoryGetRecordsService', 
        :parameters => {
          'info.specificationDepartures[0].airport.airportCode' => departing_airport_code,
          'info.specificationFlights[0].airline.airlineCode' => airline_code,
          'info.specificationFlights[0].flightNumber' => flight_number,
          'info.specificationFlights[0].searchCodeshares' => search_codeshares,
          'info.specificationDateRange.departureDateTimeMin' => date_departed_min,
          'info.specificationDateRange.departureDateTimeMax' => date_departed_max
        }
      }).parsed_response
    end
    
    def get_all_airlines
      request({
          :service => 'AirlineGetAllAirlinesService'
      }).parsed_response
    end
    
    def get_all_airports
      request({
          :service => 'AirportGetAllAirportsService'
      }).parsed_response
    end
  
    private

    def request options
      form_parameters = {}
      resp = self.class.post(
        "?Service=#{options[:service]}",
        :body => {
          'login.guid' => @guid
        }.merge(options[:parameters]||{})
      )
    end
    
  end
end
