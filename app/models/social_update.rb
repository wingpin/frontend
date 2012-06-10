require 'uri'
require 'open-uri'
require 'httparty'

module ViaME
  class Client
    include HTTParty
    
    base_uri 'http://api.via.me/v1/'
    
    def initialize(token)
      @token = token
    end
    
    def publish_status text
      request({
          :endpoint => 'post',
          :params => {
            :media_type => 'status',
            :text => text
          }
      })
    end
    
    def publish_sound text, file
      request({
          :endpoint => 'post',
          :params => {
            :media_type => 'sound',
            :text => text,
            :media => file
          }
      })
    end
  
    private

    def request options
      form_parameters = {}
      resp = self.class.post(
        "/#{options[:endpoint]}",
        :body => {
          'access_token' => @token
        }.merge(options[:params]||{})
      )
    end
    
  end
end


class SocialUpdate
  
  def self.post(account_type, callback_url, token, text, options)
    use_audio = options[:audio_url] && account_type == 'via.me'
    case account_type
    when "via.me"
      if use_audio
        file = Tempfile.new
        file.binmode
        open(options[:audio_url], {}){|data|file.write data.read}
        file.close
      end
      client = ViaME::Client.new(token)
      if file
        response = client.publish_sound(text, file)
      else
        response = client.publish_status(text)
      end
    else
      raise "unsupported account type #{account_type}"
    end
  end
  
end
