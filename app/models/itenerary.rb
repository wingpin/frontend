class Itenerary
  include Mongoid::Document
  embeds_many :itenerary_legs
  validates_length_of :itenerary_legs, :minimum => 1, :message => "must have at least one leg"

  field :pin, type: Integer
  validates_uniqueness_of :pin
  validates_numericality_of :pin
  validates_presence_of :pin
  index({ pin: 1 }, { unique: true, name: "pin_index" })
end
