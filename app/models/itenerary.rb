class Itenerary
  include Mongoid::Document
  embeds_many :social_accounts
  accepts_nested_attributes_for :social_accounts
  
  embeds_many :itenerary_legs
  accepts_nested_attributes_for :itenerary_legs
  validates_length_of :itenerary_legs, :minimum => 1, :message => "must have at least one leg"

  field :access_code, type: Integer
  validates_numericality_of :access_code
  validates_presence_of :access_code
  
  field :pin, type: Integer
  validates_uniqueness_of :pin
  validates_numericality_of :pin
  validates_presence_of :pin
  index :pin, :unique => true
end
