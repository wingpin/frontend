Frontend::Application.routes.draw do
  root :to => 'root#index'
  resources :iteneraries
end
