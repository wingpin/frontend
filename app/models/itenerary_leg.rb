class IteneraryLeg
  include Mongoid::Document
  embedded_in :itenerary

  field :airline_code, type: String
  field :flight_number, type: Integer
  field :on, type: Date

  validates_uniqueness_of :airline_code, :scope => [ :flight_number, :on ], :message => "Can't add more than one instance of a particular flight number per airline per day"
end
