Frontend::Application.routes.draw do
  root :to => 'root#index'
  resources :iteneraries

  # primary Twilio entrypoint
  match "/voice" => "voice#root"
  match "/voice/got_pin" => "voice#got_pin", :as => :voice_got_pin
  
end
