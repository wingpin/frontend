class SocialAccount
  include Mongoid::Document
  embedded_in :itenerary
  
  field :account_type, type: String
  validates_uniqueness_of :account_type
  validates_presence_of :account_type
  
  field :token, type: String
  validates_presence_of :token
  
  def self.connect_url account_type, itenerary_id
    case account_type
    when 'via.me'
      "https://api.via.me/oauth/authorize/?client_id=#{Settings.viame.client_id}&redirect_uri=#{URI.escape(show_itenerary())}&response_type=code"
    else
      raise 'unsupported account type'
    end
  end
end
