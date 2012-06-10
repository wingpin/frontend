Frontend::Application.routes.draw do

  get "oauth/callback"

  root :to => 'root#index'
  resources :iteneraries
  
  resources :social_accounts

  # primary Twilio entrypoint
  match "/voice" => "voice#root"
  match "/voice/got_pin" => "voice#got_pin", :as => :voice_got_pin
  match "/voice/create_message" => "voice#create_message", :as => :voice_create_message
  match "/voice/post_updates" => "voice#post_updates", :as => :voice_post_updates
  match "/viame_oauth/callback" => "oauth#callback", :as => :viame_oauth_callback
  
end
