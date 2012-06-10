class IteneraryLeg
  include Mongoid::Document
  embedded_in :itenerary

  field :airline_code, type: String
  validates_presence_of :airline_code
  
  field :flight_number, type: Integer
  validates_presence_of :flight_number
  validates_numericality_of :flight_number
  validates_uniqueness_of :flight_number, :scope => [ :airline_code, :departing_airport_code, :on ], :message => "Can't add more than one instance of a particular flight number per airline per day"
  
  field :departing_airport_code, type: String
  validates_presence_of :departing_airport_code
  
  field :on, type: String
  validates_presence_of :on
  
  def flight
    Flight.find(airline_code, flight_number, on, departing_airport_code)
  end
end
