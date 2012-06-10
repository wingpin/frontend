Frontend::Application.routes.draw do
  root :to => 'root#index'
  resources :iteneraries

  # primary Twilio entrypoint
  match "/voice" => "voice#root"
end
